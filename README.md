# Number Trivia

This is a Flutter Application, with a custom 4-Layers clean architecture

## Concept

This app contains a custom architecture. It is based on a clean architecture, except that we add a new "api layer".
The purpose of this new layer is to set interfaces or abstract classes in it, in order to improve the testability of every other layer.
It also reduces the dependencies between each layer and the complexity of them (domain or data agnostic?)

Therefore, each layer has a dependency on "api" layer, and "api" layer knows every other layers. Thus, it is way easier to handle dependencies and tests for every layers.

## What does it use?

- Dependency injection using Get it
- Store and ViewModels using MobX
- SharedPreferences
- Api calls using Dio
- Various packages for every layer



