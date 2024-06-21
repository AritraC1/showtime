import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TVSeriesScreen extends StatefulWidget {
  const TVSeriesScreen({super.key});

  @override
  State<TVSeriesScreen> createState() => _TVSeriesScreenState();
}

class _TVSeriesScreenState extends State<TVSeriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // TRENDING SERIES
              Text(
                "Trending Series",
                style: GoogleFonts.aBeeZee(
                    fontSize: 27, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              SizedBox(
                child: FutureBuilder(future: future, builder: builder),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
