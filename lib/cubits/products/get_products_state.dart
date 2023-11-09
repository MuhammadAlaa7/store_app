abstract class AllProductsStates {}

class AllProductsInitialState extends AllProductsStates {}

class AllProductsSuccessState extends AllProductsStates {}

class AllProductsLoadingState extends AllProductsStates {}

class AllProductsFailureState extends AllProductsStates {
  final String errorMessage;
  AllProductsFailureState(this.errorMessage);
}
