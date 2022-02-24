import 'package:bloc/bloc.dart';
import 'package:krypto/models/Crypto.dart';
import 'package:krypto/services/CryptoService.dart';
import 'package:meta/meta.dart';

part 'crypto_data_event.dart';
part 'crypto_data_state.dart';

class CryptoDataBloc extends Bloc<CryptoDataEvent, CryptoDataState> {
  final CryptoService _cryptoService;
  CryptoDataBloc(this._cryptoService) : super(CryptoDataInitialState()) {
    on<CryptoDataEvent>((event, emit) async {
      if (event is LoadCryptoDataEvent) {
        emit(CryptoDataLoadingState());
        List<Crypto>? cryptoList = await _cryptoService.fetchCryptoData();
        if (cryptoList == null) {
          emit(CryptoDataErrorState());
        } else {
          emit(CryptoDataLoadedState(cryptoList: cryptoList));
        }
      }
    });
  }
}
