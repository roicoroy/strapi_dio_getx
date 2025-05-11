import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as mt;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:strapi_dio_getx/app/model/cow_logger.dart';

import '../../home/data/product.dart';
import '../../home/views/product_details_screen.dart';

class LoggerList extends StatefulWidget {
  LoggerList(this.log, {super.key});

  final List<Datum> log;

  @override
  State<LoggerList> createState() => _LoggerListState();
}

class _LoggerListState extends State<LoggerList> {
  bool showCart = false;

  bool showDetails = false;

  double storeHeight = 770;

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.sizeOf(context);

    return GestureDetector(
      child: Container(
        color: Colors.black,
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            AnimatedPositioned(
              top: showCart ? -storeHeight : 0,
              curve: Curves.easeOutQuad,
              duration: const Duration(milliseconds: 500),
              child: Container(
                height: mediaQuery.height,
                width: mediaQuery.width,
                decoration: const BoxDecoration(
                  color: Color(0xffe8e6dc), //Colors.grey.shade300,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(60),
                    bottomRight: Radius.circular(60),
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      // flex: 1,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(60),
                          bottomRight: Radius.circular(60),
                        ),
                        child: AnimationLimiter(
                          child: GridView.builder(
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5.0,
                                  childAspectRatio: 0.75,
                                ),
                            itemCount: widget.log.length,
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            itemBuilder: (context, index) {
                              return AnimationConfiguration.staggeredGrid(
                                position: index,
                                columnCount: 2,
                                duration: const Duration(milliseconds: 500),
                                child: ScaleAnimation(
                                  child: FadeInAnimation(
                                    child: GestureDetector(
                                      onTap: () async {
                                        setState(() {
                                          showDetails = true;
                                        });
                                        final result = await Navigator.of(
                                          context,
                                        ).push(
                                          PageRouteBuilder(
                                            transitionDuration: const Duration(
                                              milliseconds: 700,
                                            ),
                                            reverseTransitionDuration:
                                                const Duration(
                                                  milliseconds: 800,
                                                ),
                                            pageBuilder:
                                                (
                                                  context,
                                                  animation,
                                                  secondaryAnimation,
                                                ) => FadeTransition(
                                                  opacity: animation,
                                                  child: ProductDetailScreen(
                                                    product: products[index],
                                                    onAddProduct: (product) {},
                                                    log: widget.log[index],
                                                  ),
                                                ),
                                            transitionsBuilder: (
                                              context,
                                              animation,
                                              secondaryAnimation,
                                              child,
                                            ) {
                                              return child;
                                            },
                                          ),
                                        );

                                        if (result != null) {
                                          setState(() {
                                            showDetails = false;
                                          });
                                        }
                                      },
                                      child: Card(
                                        shape: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(
                                            15.r,
                                          ),
                                          borderSide: BorderSide.none,
                                        ),
                                        color: Colors.white,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 15.0,
                                          ),
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 100,
                                                width: 140,
                                                child: Hero(
                                                  tag:
                                                      "${widget.log[index].id}",
                                                  // child: mt.Image.asset(
                                                  //   products[index].imageUrl,
                                                  // ),
                                                  child: mt.Image.network(
                                                    widget
                                                        .log[index]
                                                        .image!
                                                        .url!,
                                                  ),
                                                ),
                                              ),
                                              // const Spacer(),
                                              Text(
                                                widget.log[index].name,
                                                style: GoogleFonts.lexendDeca()
                                                    .copyWith(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              // const SizedBox(height: 5),
                                              Text(
                                                widget.log[index].description,
                                                style: GoogleFonts.quicksand()
                                                    .copyWith(fontSize: 16),
                                              ),
                                              Text(
                                                DateFormat('yyyy-MM-dd').format(
                                                  widget.log[index].date!,
                                                ),
                                                // widget.log[index].date!
                                                //     .toUtc()
                                                //     .toIso8601String(),
                                                style: GoogleFonts.quicksand()
                                                    .copyWith(fontSize: 14),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
