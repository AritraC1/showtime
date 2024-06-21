import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:showtime/api/api.dart';
import 'package:showtime/models/series.dart';
import 'package:showtime/widgets/movies_slider.dart';
import 'package:showtime/widgets/trending_slider.dart';

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
              // TRENDING MOVIES
              Text(
                "Trending Series",
                style: GoogleFonts.aBeeZee(
                    fontSize: 27, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 30),
              SizedBox(
                child: FutureBuilder(
                  future: trendingSeries,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TrendingSlider(snapshot: snapshot);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 35),

              // TOP RATED MOVIES
              Text(
                'Top Rated Movies',
                style: GoogleFonts.aBeeZee(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),
              SizedBox(
                child: FutureBuilder(
                  future: topRatedSeries,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MoviesSlider(snapshot: snapshot);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              const SizedBox(height: 35),

              // UPCOMING MOVIES
              Text(
                'Upcoming Movies',
                style: GoogleFonts.aBeeZee(
                    fontSize: 30, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 20),
              SizedBox(
                child: FutureBuilder(
                  future: upcomingSeries,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return MoviesSlider(snapshot: snapshot);
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
