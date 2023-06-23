import 'package:comnsec_mc_app/constants/constants.dart';
import 'package:comnsec_mc_app/controller/get_x.dart';
import 'package:comnsec_mc_app/model/artist_model.dart';
import 'package:comnsec_mc_app/model/music_model.dart';
import 'package:comnsec_mc_app/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultScreen extends StatefulWidget {
  const SearchResultScreen({Key? key}) : super(key: key);

  @override
  State<SearchResultScreen> createState() => _SearchResultScreenState();
}

class _SearchResultScreenState extends State<SearchResultScreen> {

  GetController layoutController = Get.put(GetController());

  @override
  void initState() {
    layoutController.search(context, layoutController.searchController.text);

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      bottomNavigationBar: buildIgnorePointer(),
      body: Obx(() => SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       const Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                           Text(
                            "Search results for",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                           Icon(Icons.play_arrow_rounded,
                             size: 35,
                             color: Colors.white,)
                         ],
                       ),
                      Text(
                        '"${layoutController.searchController.text}"',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  layoutController.isSearchResultsLoading.value?
                      const Center(
                          child: CircularProgressIndicator(
                            color: buttonColor,)):
                      layoutController.searchResults.isEmpty?
                      const Center(
                        child: Text(
                          "No Results Found",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ):
                      ListView.builder(
                        itemCount: layoutController.searchResults.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          var result = layoutController.searchResults[index];

                          if (result is MusicModel) {
                            return _buildMusicItem(result);
                          }
                          else if (result is ArtistModel) {
                            return _buildArtistItem(result);
                          }
                          else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                  const SizedBox(height: 20,)
                ],
              ),
            ),
          ),
        ),
      ),
      )
    );
  }

  Widget? _buildArtistItem(ArtistModel artist) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                borderRadius:
                BorderRadius.circular(100),
                image: const DecorationImage(
                  image: AssetImage(
                      "assets/images/artist.jpg"),
                )),
          ),
          const SizedBox(width: 20),
          Text(
            artist.name
                .toString(),
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget? _buildMusicItem(MusicModel music) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: Container(
        width: Get.width,
        height: Get.height/4,
        decoration: BoxDecoration(
          color: bottombarColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),
              child: Stack(
                children: [
                  Container(
                    height: 150,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage(
                            "assets/images/music_bg.jpg"),
                        fit: BoxFit.cover),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white24,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 5.0,vertical: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.star_rounded,
                                color: Colors.white,
                                size: 15,),
                                Text("4.2",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10
                                ),)
                              ],
                            ),
                          ),
                        ),
                        const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white24,
                          child: Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text('"${music.title}"' " by "+ music.artistCredit![0].name.toString(),
                    style: const TextStyle(
                      color: Colors.white
                    ),),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: buttonColor),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 5),
                      child: Text(
                        "Play",
                        style:
                        TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
