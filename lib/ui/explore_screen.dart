import 'package:comnsec_mc_app/constants/constants.dart';
import 'package:comnsec_mc_app/controller/get_x.dart';
import 'package:comnsec_mc_app/model/artist_model.dart';
import 'package:comnsec_mc_app/model/music_model.dart';
import 'package:comnsec_mc_app/ui/search_result_screen.dart';
import 'package:comnsec_mc_app/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({Key? key}) : super(key: key);

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {

    GetController layoutController = Get.put(GetController());

    return Scaffold(
      backgroundColor: scaffoldColor,
      bottomNavigationBar: buildIgnorePointer(),
      body: Obx(() => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        height: 55,
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            height: 1,
                          ),
                          textAlign: TextAlign.left,
                          textAlignVertical: TextAlignVertical.center,
                          cursorColor: Colors.white,
                          controller: layoutController.searchController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          onSubmitted: (val){
                            if(layoutController.searchController.text.isNotEmpty) {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                  const SearchResultScreen()));
                            }
                          },
                          decoration: buildInputDecoration(
                            InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                      const SearchResultScreen()));
                                },
                                child: const Icon(
                                    Icons.search,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Wrap(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Icon(Icons.notifications, color: Colors.white),
                          ),
                          Image.asset(
                            'assets/images/avatar.png',
                            height: 25,
                            width: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                if (layoutController.recentSearches.isNotEmpty)
                  Wrap(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "Recent Searches",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                             layoutController.recentSearches.clear();
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: buttonColor,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
                                child: Text(
                                  "Clear",
                                  style: TextStyle(fontSize: 12, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        itemCount: layoutController.recentSearches.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (context, index) {
                          var result = layoutController.recentSearches[index];

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
                      )
                    ],
                  ),
                const SizedBox(height: 20),
                const Text(
                  "Popular Genres",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.0,
                    mainAxisSpacing: 15.0,
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    childAspectRatio: 1.5,
                    children: List.generate(4, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage("assets/images/bg.jpg"),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Center(
                          child: Text(
                            layoutController.genreList[index].name.toString(),
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 20,),
              ],
            )
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
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(100),
                    image: const DecorationImage(
                      image: AssetImage(
                          "assets/images/bg3.jpg"),
                    )),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    artist.name
                        .toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    'Artist',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
    );
  }

  Widget? _buildMusicItem(MusicModel music) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
        children: [
          Wrap(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(100),
                    image: const DecorationImage(
                      image: AssetImage(
                          "assets/images/bg3.jpg"),
                    )),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width-200,
                    child: Text(
                      music.title
                          .toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  Text(
                    music.artistCredit![0].name.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  )
                ],
              )
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            color: Colors.white,
            size: 20,
          )
        ],
      ),
    );
  }
}
