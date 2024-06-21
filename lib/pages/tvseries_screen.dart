import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showtime/api/api.dart';
import 'package:showtime/models/series.dart';

class TVSeriesScreen extends StatefulWidget {
  const TVSeriesScreen({super.key});

  @override
  State<TVSeriesScreen> createState() => _TVSeriesScreenState();
}

class _TVSeriesScreenState extends State<TVSeriesScreen> {
  late Future<List<Series>> trendingSeries;
  late Future<List<Series>> topRatedSeries;
  late Future<List<Series>> upcomingSeries;

  @override
  void initState() {
    super.initState();
    trendingSeries = Api().getTrendingSeries();
    topRatedSeries = Api().getTopRatedSeries();
    upcomingSeries = Api().getUpcomingSeries();
  }

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
