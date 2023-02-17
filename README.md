# Riverpod Learning

## Providers

All the available providers:

### Provider

- Read-Only Provider
- Maybe good for constant value across entire apps

### StateProvider

- Simple Provider
- Good for update a simple value
- Rare to use cause apps usualy have a complex data and need its provider

### StateNotifier and StateNotifierProvider

- Best Approuch for complex state

### ChangeNotifier and ChangeNotifierProvider

- Only transition from Provider to Riverpod
- Backward compatible for user that use Provider state management
- Not recomended by Riverpod docs to use this anymore
- Do not have access to data model and state
- Use notifyListeners(); inside method to update UI.
- This provider is MUTABLE (very bad), it can change its property outside the class

### Future Provider

- Provider based on async code
- Replacement for FutureBuilder provided by Riverpod

### Stream Provider

- Return stream
- Replacement for StreamBuildeer provided by Riverpod

## Provider Observer

- Observe all providers lifecycle (remove, added, listen, etc)
- Use for loggin and dev tools for Riverpod environment
- It is like parent class for all providers
- Provider Container = is what use within the provider scope

## Modifiers

Genererics type of provider

### Family

- Extends use of other provider that treated provider like a function
- Limitation: only 1 input parameter
- There are time when input never change
- There are time when input can be changed but never reuse

### autoDispose

- Avoid memory leak in app whenever provider not used anymore
- Better use for provider only by event like Stream Subcription etc.

## Screen

### ConsumerWidget

- Alternatively for StatelessWidget

### ConsumerStateWidget

- Alternatively for StatefulWidget

## Other Notes

### AsyncValue

- Better version / Replacement of AsyncSnapshot
- Problem with AsyncSnapshot:
- snapshot.data, snapshot.error they are not interconnected with each other

### Ref

- Super class for WidgetRef and ProviderRef
- Can be used to other class that need ref

### WidgetRef

- Allow us talk from widget to provider

### ProfiderRef

- Allow us talk from provider to another provider

### ProviderRef.keepAlive

- Used under autoDispose modifiers
- Whenever provider dispose and u want to preserve tha state of its provider
- and make sure the state is still there

### ref.onDispose

- run something after dispose

### ref.onCancel

- run something after no longer being used anytime

### ref.OnResume

- run something after used again

### ref.onAddListener and ref.onRemoveListeners
