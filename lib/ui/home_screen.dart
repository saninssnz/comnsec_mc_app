import 'package:comnsec_mc_app/constants/constants.dart';
import 'package:comnsec_mc_app/controller/get_x.dart';
import 'package:comnsec_mc_app/ui/explore_screen.dart';
import 'package:comnsec_mc_app/utils/util_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GetController layoutController = Get.put(GetController());

  @override
  void initState() {
    layoutController.getGenres(context, 'all');
    layoutController.getMusicDetails(context, 'michael%20jackson');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: scaffoldColor,
        bottomNavigationBar: buildIgnorePointer(),
        body: Obx(
          () => SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Good afternoon, San!",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 15),
                        ),
                        Wrap(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child:
                                  Icon(Icons.headphones, color: Colors.white),
                            ),
                            Image.asset(
                              'assets/images/avatar.png',
                              height: 25,
                              width: 25,
                            )
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Discover Music",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    const ExploreScreen()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: buttonColor),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 5),
                              child: Text(
                                "Explore",
                                style:
                                    TextStyle(fontSize: 12, color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    layoutController.isGenresLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                            color: buttonColor,
                          ))
                        : SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 150,
                            child: GridView.count(
                              crossAxisCount: 3,
                              crossAxisSpacing: 8.0,
                              mainAxisSpacing: 8.0,
                              physics: const ScrollPhysics(),
                              shrinkWrap: true,
                              children: List.generate(3, (index) {
                                return Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    image: const DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          buttonColor, BlendMode.color),
                                      image:
                                          AssetImage("assets/images/bg2.jpg"),
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      layoutController.genreList[index].name
                                          .toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Popular Songs",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    layoutController.isMusicLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: buttonColor,
                            ),
                          )
                        : SizedBox(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: 3,
                              itemBuilder: (context, index) {
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
                                                      "assets/images/artist.jpg"),
                                                )),
                                          ),
                                          const SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                layoutController
                                                    .musicList[index].title
                                                    .toString(),
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 15,
                                                ),
                                              ),
                                              Text(
                                                layoutController
                                                    .musicList[index]
                                                    .artistCredit![0]
                                                    .name
                                                    .toString(),
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
                                        Icons.play_arrow_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      )
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
