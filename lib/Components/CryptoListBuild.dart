import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krypto/Components/Glassmorphism.dart';
import 'package:krypto/Screens/DetailsPage.dart';
import 'package:krypto/models/Crypto.dart';

class BuildCryptoListWidget extends StatelessWidget {
  const BuildCryptoListWidget({
    Key? key,
    required this.cryptoList,
  }) : super(key: key);

  final List<Crypto> cryptoList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: cryptoList.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var cryptoItem = cryptoList[index];
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GlassMorphism(
              start: 0.3,
              end: 0.6,
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          DetailsPage(crypto: cryptoItem, index: index)));
                },
                child: Container(
                    padding: const EdgeInsets.all(8.0),
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Hero(
                              tag: index,
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: cryptoItem.image != null ||
                                        cryptoItem.image != ""
                                    ? CachedNetworkImage(
                                        colorBlendMode: BlendMode.softLight,
                                        imageUrl: cryptoItem.image ?? "",
                                        imageBuilder:
                                            (context, imageProvider) =>
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
                              width: 8.0,
                            ),
                            Text(
                              cryptoItem.name!.toString() +
                                  " (" +
                                  cryptoItem.symbol!.toUpperCase() +
                                  ")",
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "\$ " + cryptoItem.currentPrice!.toString(),
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              cryptoItem.priceChangePercentage24h!
                                      .toStringAsFixed(2) +
                                  " %",
                              style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.w700,
                                  color:
                                      cryptoItem.priceChangePercentage24h! < 0
                                          ? Colors.red[700]
                                          : Colors.green[700]),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
            ),
          );
        });
  }
}
