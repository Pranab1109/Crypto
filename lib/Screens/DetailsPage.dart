import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krypto/Components/Glassmorphism.dart';
import 'package:krypto/Components/rowWidget.dart';
import 'package:krypto/models/Crypto.dart';

class DetailsPage extends StatelessWidget {
  final Crypto crypto;
  final int index;
  const DetailsPage({Key? key, required this.crypto, required this.index})
      : super(key: key);

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
        backgroundColor: Colors.transparent,
        body: Center(
          child: Center(
            child: GlassMorphism(
              end: 0.7,
              start: 0.3,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.88,
                height: MediaQuery.of(context).size.height * 0.5,
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    Hero(
                      tag: index,
                      child: SizedBox(
                        width: 70.0,
                        height: 70.0,
                        child: crypto.image != null || crypto.image != ""
                            ? CachedNetworkImage(
                                colorBlendMode: BlendMode.softLight,
                                imageUrl: crypto.image ?? "",
                                imageBuilder: (context, imageProvider) =>
                                    Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                              )
                            : const SizedBox(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Center(
                        child: Text(
                      crypto.name!.toString() +
                          " (" +
                          crypto.symbol!.toUpperCase() +
                          ")",
                      style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    )),
                    const SizedBox(
                      height: 10.0,
                    ),
                    RowWidget(
                      txtl: "Current Price",
                      txtr: "\$ " + crypto.currentPrice.toString(),
                    ),
                    RowWidget(
                      txtl: "High 24 hr",
                      txtr: "\$ " + crypto.high24h.toString(),
                    ),
                    RowWidget(
                      txtl: "Low 24 hr",
                      txtr: "\$ " + crypto.low24h.toString(),
                    ),
                    RowWidget(
                      txtl: "Price Change 24 hr",
                      txtr: "\$ " + crypto.priceChange24h!.toStringAsFixed(3),
                    ),
                    RowWidget(
                      txtl: "Price Change % 24 hr",
                      txtr: crypto.priceChangePercentage24h.toString() + " %",
                    ),
                    RowWidget(
                      txtl: "Current Price",
                      txtr: "\$ " + crypto.currentPrice.toString(),
                    ),
                    RowWidget(
                      txtl: "Market Cap",
                      txtr: "\$ " + crypto.marketCap.toString(),
                    ),
                    RowWidget(
                      txtl: "Market Cap Change % 24 hr",
                      txtr:
                          crypto.marketCapChangePercentage24h.toString() + " %",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
