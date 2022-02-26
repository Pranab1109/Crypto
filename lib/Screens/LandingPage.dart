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
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            "https://images.unsplash.com/photo-1642104704074-907c0698cbd9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1632&q=80",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
          // extendBodyBehindAppBar: true,
          backgroundColor: Colors.transparent,
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
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        'Refreshing',
                        style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.white,
                    ));
                    return Future.delayed(
                        const Duration(microseconds: 1), () {});
                  },
                  child: BuildCryptoListWidget(cryptoList: cryptoList),
                );
              }
              return Container();
            },
          )),
    );
  }
}

/* */