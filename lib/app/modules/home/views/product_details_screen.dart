import 'package:flutter/cupertino.dart' as cup;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../model/cow_logger.dart';
import '../data/product.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({
    this.product,
    required this.onAddProduct,
    super.key,
    required this.log,
  });

  final Product? product;
  final Datum log;

  // final VoidCallback onAddProduct;
  final Function(Product product) onAddProduct;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late String heroTage = "";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(true);
        return true;
      },
      child: Scaffold(
        // backgroundColor: Colors.grey.shade300,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade200,
          elevation: 0,
          title: const Text(''),
        ),
        body: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 10,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SafeArea(
                        child: Center(
                          child: SizedBox(
                            height: 150,
                            width: 150,
                            child: Hero(
                              tag: "${widget.log.id}",
                              child: cup.Image.network(widget.log.image!.url!),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        widget.log.name,
                        style: GoogleFonts.lexendDeca().copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "500 g",
                        style: GoogleFonts.quicksand().copyWith(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Desciption: ",
                        style: GoogleFonts.quicksand().copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        widget.log.description,
                        style: GoogleFonts.quicksand().copyWith(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Container(
            //   height: 180,
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //     gradient: LinearGradient(
            //       begin: Alignment.center,
            //       end: Alignment.topCenter,
            //       colors: [Colors.white, Colors.white10],
            //     ),
            //   ),
            //   child: SafeArea(
            //     child: Padding(
            //       padding: const EdgeInsets.only(
            //         left: 30.0,
            //         right: 30.0,
            //         top: 50.0,
            //       ),
            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.center,
            //         children: [
            //           ElevatedButton(
            //             onPressed: () {},
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: const Color(
            //                 0xffFEC449,
            //               ), // Background color
            //             ),
            //             child: SizedBox(
            //               height: 50,
            //               width: MediaQuery.sizeOf(context).width / 2,
            //               child: Center(
            //                 child: Text(
            //                   "Submit to log",
            //                   style: GoogleFonts.lexendDeca().copyWith(
            //                     color: Colors.black,
            //                     fontSize: 16,
            //                   ),
            //                 ),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
        bottomSheet: Container(
          height: 180,
          decoration: const BoxDecoration(
            color: Colors.white,
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.topCenter,
              colors: [Colors.white, Colors.white10],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
                top: 50.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(
                        0xffFEC449,
                      ), // Background color
                    ),
                    child: SizedBox(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width / 2,
                      child: Center(
                        child: Text(
                          "Submit to log",
                          style: GoogleFonts.lexendDeca().copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
