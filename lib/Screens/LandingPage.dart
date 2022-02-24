import 'package:google_fonts/google_fonts.dart';
import 'package:krypto/Components/CryptoListBuild.dart';
import 'package:krypto/services/bloc/crypto_data_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/Crypto.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.indigo[300],
        appBar: AppBar(
          title: Text(
            "Krypto",
            style: GoogleFonts.aBeeZee(
                fontWeight: FontWeight.bold, letterSpacing: 3.0),
          ),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: BlocBuilder<CryptoDataBloc, CryptoDataState>(
          builder: (context, state) {
            if (state is CryptoDataInitialState) {
              context.read<CryptoDataBloc>().add(LoadCryptoDataEvent());
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CryptoDataLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CryptoDataErrorState) {
              return const Center(
                child: Text("Oops! Something went wrong!"),
              );
            } else if (state is CryptoDataLoadedState) {
              List<Crypto> cryptoList = state.cryptoList;
              return RefreshIndicator(
                onRefresh: () {
                  context.read<CryptoDataBloc>().add(LoadCryptoDataEvent());
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Refreshing'),
                    behavior: SnackBarBehavior.floating,
                  ));
                  return Future.delayed(const Duration(microseconds: 1), () {});
                },
                child: BuildCryptoListWidget(cryptoList: cryptoList),
              );
            }
            return Container();
          },
        ));
  }
}
