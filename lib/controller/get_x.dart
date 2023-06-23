import 'dart:convert';

import 'package:comnsec_mc_app/model/artist_model.dart';
import 'package:comnsec_mc_app/model/genre_model.dart';
import 'package:comnsec_mc_app/model/music_model.dart';
import 'package:comnsec_mc_app/utils/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

class GetController extends GetxController {

  TextEditingController searchController = TextEditingController();
  RxBool isGenresLoading = false.obs;
  RxBool isMusicLoading = false.obs;
  RxBool isSearchResultsLoading = false.obs;
  RxList<GenreModel> genreList = <GenreModel>[].obs;
  RxList<MusicModel> musicList = <MusicModel>[].obs;
  RxList<MusicModel> music = <MusicModel>[].obs;
  RxList<ArtistModel> artists = <ArtistModel>[].obs;
  RxList<dynamic> searchResults = <dynamic>[].obs;
  RxList<dynamic> recentSearches = <dynamic>[].obs;

  Map<String, String>? headers = {'Accept': 'application/json'};



  Future<void> getGenres(BuildContext context, String val) async {
    http.Response response;

    isGenresLoading.value = true;

    String url = Api.BASE_URL+Api.GENRE_API+val;

    response = await http.get(Uri.parse(url),headers: headers);

    isGenresLoading.value = false;

    if (response.statusCode == 200) {
      String responseString = response.body;
      var data = jsonDecode(responseString);
      var resultData = data["genres"];

      genreList = RxList<GenreModel>.from(
          resultData.map((x) => GenreModel.fromJson(x)));

      genreList.refresh();
      update();
    }
  }

  Future<void> getMusicDetails(BuildContext context, String val) async {
    http.Response response;

    isMusicLoading.value = true;

    String url = Api.BASE_URL+Api.SEARCH_RECORDINGS_API+val;

    response = await http.get(Uri.parse(url),headers: headers);

    isMusicLoading.value = false;

    if (response.statusCode == 200) {
      String responseString = response.body;
      var data = jsonDecode(responseString);
      var resultData = data["recordings"];

      musicList = RxList<MusicModel>.from(
          resultData.map((x) => MusicModel.fromJson(x)));

      musicList.refresh();
      update();
    }
  }

  Future search(BuildContext context, String query) async {
    isSearchResultsLoading.value = true;
    query = query.replaceAll(' ', '%20');

    String artistUrl = Api.BASE_URL + Api.SEARCH_ARTIST_API + query;
    String musicUrl = Api.BASE_URL + Api.SEARCH_RECORDINGS_API + query;

    var artistResponse = await http.get(Uri.parse(artistUrl), headers: headers);
    var musicResponse = await http.get(Uri.parse(musicUrl), headers: headers);

    isSearchResultsLoading.value = false;

      if(artistResponse.statusCode == 200){
        String responseString = artistResponse.body;
        var data = jsonDecode(responseString);
        var resultData = data["artists"];

        artists = RxList<ArtistModel>.from(
            resultData.map((x) => ArtistModel.fromJson(x)));

        artists.refresh();
        update();
      }
      else{
        artists = <ArtistModel>[].obs;
      }

      if(musicResponse.statusCode == 200){
        String responseString = musicResponse.body;
        var data = jsonDecode(responseString);
        var resultData = data["recordings"];

        music = RxList<MusicModel>.from(
            resultData.map((x) => MusicModel.fromJson(x)));

        music.refresh();
        update();
      }
      else{
        music = <MusicModel>[].obs;
      }

      searchResults = [...music, ...artists].obs;
      recentSearches.insertAll(0,[music.first, artists.first].obs);
      searchResults.refresh();
      recentSearches.refresh();
      update();
  }

}