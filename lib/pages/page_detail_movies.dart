import 'package:flutter/material.dart';

import 'package:netfolks/models/now_playing_model.dart';
import 'package:netfolks/api_call/movie_db_api_source.dart';

class PageDetailMovies extends StatefulWidget {
  const PageDetailMovies({Key? key}) : super(key: key);

  @override
  _PageDetailMoviesState createState() => _PageDetailMoviesState();
}

class _PageDetailMoviesState extends State<PageDetailMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Now Playing List"),
      ),
      body: _buildDetailCountriesBody(),
    );
  }

  Widget _buildDetailCountriesBody() {
    return Container(
      child: FutureBuilder(
        // future: MovieDataSource.instance.nowPlaying(),
        future: MovieDataSource.instance.nowPlaying(),
        builder: (
            BuildContext context,
            AsyncSnapshot<dynamic> snapshot,
            ) {
          if (snapshot.hasError) {
            return _buildErrorSection();
          }
          if (snapshot.hasData) {
            NowPlayingModel nowPlayingModel =
            NowPlayingModel.fromJson(snapshot.data);
            return _buildSuccessSection(nowPlayingModel);
          }
          return _buildLoadingSection();
        },
      ),
    );
  }

  Widget _buildErrorSection() {
    return Text("Error");
  }

  Widget _buildEmptySection() {
    return Text("Empty");
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(NowPlayingModel data) {
    return ListView.builder(
      itemCount: data.results?.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildItemCountries("${data.results?[1].originalTitle}");
      },
    );
  }

  Widget _buildItemCountries(String value) {
    return Text(value);
  }
}
