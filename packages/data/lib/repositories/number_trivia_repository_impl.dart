import 'package:api/number_trivia_local_datasource.dart';
import 'package:api/number_trivia_remote_datasource.dart';
import 'package:api/models/number_trivia_model.dart';
import 'package:data/utils/network_info.dart';
import 'package:api/models/data_response.dart';
import 'package:api/number_trivia_repository.dart';
import 'package:api/models/failures.dart';

typedef Future<NumberTriviaModel> _concreteOrRandomChooser();

class NumberTriviaRepositoryImpl implements NumberTriviaRepository{

  final NumberTriviaRemoteDatasource remoteDatasource;
  final NumberTriviaLocalDatasource localDatasource;
  final NetworkInfo networkInfo;

  NumberTriviaRepositoryImpl({
    required this.remoteDatasource,
    required this.localDatasource,
    required this.networkInfo
  });

  @override
  Future<DataResponse> getConcreteNumberTrivia(int number) async {
    return await _getTrivia(() {
      return remoteDatasource.getConcreteNumberTrivia(number);
    });
  }

  @override
  getRandomNumberTrivia() async {
    return await _getTrivia(() {
      return remoteDatasource.getRandomNumberTrivia();
    });
  }

  Future<DataResponse> _getTrivia(_concreteOrRandomChooser getConcreteOrRandom) async {
    if(await networkInfo.isConnected){
      try{
        final remoteTrivia = await getConcreteOrRandom();
        localDatasource.cacheNumberTrivia(remoteTrivia);
        return DataResponse(numberTrivia: remoteTrivia, failures: null);
      } on ServerFailure {
        return DataResponse(numberTrivia: NumberTriviaModel(text: "", number: -1), failures: ServerFailure());
      }
    } else {
      try{
        final localTrivia = await localDatasource.getLastNumberTrivia();
        return DataResponse(numberTrivia: localTrivia, failures: null);
      } on CacheFailure {
        return DataResponse(numberTrivia: NumberTriviaModel(text: "", number: -1), failures: CacheFailure());
      }
    }
  }
}