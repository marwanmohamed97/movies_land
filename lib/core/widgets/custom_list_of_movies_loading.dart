import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomListOfMoviesLoading extends StatelessWidget {
  const CustomListOfMoviesLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 30),
      child: SizedBox(
        width: 400,
        height: 150,
        child: Shimmer.fromColors(
          baseColor: Colors.grey[500]!,
          highlightColor: Colors.grey[200]!,
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 227, 226, 226),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 6,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width / 2.2,
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width / 2.6,
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width / 3,
                        height: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        width: MediaQuery.of(context).size.width / 8,
                        height: 16,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
