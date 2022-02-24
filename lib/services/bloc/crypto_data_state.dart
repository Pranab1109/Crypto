part of 'crypto_data_bloc.dart';

@immutable
abstract class CryptoDataState {}

class CryptoDataInitialState extends CryptoDataState {}

class CryptoDataLoadingState extends CryptoDataState {}

class CryptoDataLoadedState extends CryptoDataState {
  final List<Crypto> cryptoList;
  CryptoDataLoadedState({required this.cryptoList});
}

class CryptoDataErrorState extends CryptoDataState {}
