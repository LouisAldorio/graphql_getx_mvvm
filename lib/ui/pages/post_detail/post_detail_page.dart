import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/ui/components/comment_box.dart';
import 'package:graphql_getx_mvvm/ui/components/comment_card.dart';
import 'package:graphql_getx_mvvm/ui/pages/post_detail/post_view_model.dart';
import 'package:intl/intl.dart' show toBeginningOfSentenceCase;
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';

class PostDetail extends StatelessWidget {
  PostDetail({Key? key}) : super(key: key);

  final PostViewModel viewModel = Get.put(PostViewModel());

  @override
  Widget build(BuildContext context) {
    viewModel.getPost(Get.arguments["id"]);

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text("Detail"),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Hero(
                      tag: "card_thumbnail${Get.arguments["id"]}",
                      child: Image(
                        image: NetworkImage(
                            "https://source.unsplash.com/random/300x300/?girl"),
                        fit: BoxFit.cover,
                      )),
                  Obx(() {
                    final post = viewModel.result.value.data;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: viewModel.isLoading.value
                          ? Center(
                              heightFactor: 4,
                              child: SpinKitWave(
                                color: Colors.green,
                                size: 60.0,
                              ),
                            )
                          : Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    toBeginningOfSentenceCase(
                                            post?.title.toString())
                                        .toString(),
                                    style:
                                        Theme.of(context).textTheme.headline4),
                                Text("by " + post!.author.name,
                                    style:
                                        Theme.of(context).textTheme.subtitle1),
                                SizedBox(height: 10),
                                Text(post.body,
                                    style: Theme.of(context).textTheme.caption),
                                SizedBox(height: 10),
                                Text("Author's Biography",
                                    style:
                                        Theme.of(context).textTheme.headline5),
                                Card(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: NetworkImage(
                                              "https://source.unsplash.com/random/300x300/?boy"),
                                        ),
                                        title: Text(post.author.name),
                                        subtitle: Text(post.author.email! +
                                            " | " +
                                            post.author.website!),
                                      ),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 400,
                                        child: FlutterMap(
                                          options: MapOptions(
                                            center: LatLng(
                                                post.author.address!.geo
                                                    .latitude,
                                                post.author.address!.geo
                                                    .longitude),
                                            zoom: 13.0,
                                          ),
                                          layers: [
                                            TileLayerOptions(
                                              urlTemplate:
                                                  "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                                              subdomains: ['a', 'b', 'c'],
                                              attributionBuilder: (_) {
                                                return Text(
                                                    "© OpenStreetMap contributors");
                                              },
                                            ),
                                            MarkerLayerOptions(
                                              markers: [
                                                Marker(
                                                  width: 80.0,
                                                  height: 80.0,
                                                  point: LatLng(
                                                      post.author.address!.geo
                                                          .latitude,
                                                      post.author.address!.geo
                                                          .longitude),
                                                  builder: (ctx) =>
                                                      FlutterLogo(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "${post.author.address!.street} ${post.author.address!.suite} ${post.author.address!.city} ${post.author.address!.zipcode}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .caption,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            Text("Phone :",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1),
                                            Text(" ${post.author.phone}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            8.0, 3, 8.0, 3),
                                        child: Row(
                                          children: [
                                            Text("Company :",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1),
                                            Text(
                                                " ${post.author.company!.name}",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Wrap(
                                            // crossAxisAlignment: CrossAxisAlignment.start,
                                            children:
                                                "${post.author.company!.catchPhrase} ${post.author.company!.bs}"
                                                    .split(" ")
                                                    .map((e) => Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3.0),
                                                          child: Chip(
                                                            avatar:
                                                                CircleAvatar(
                                                              backgroundColor:
                                                                  Colors.green[
                                                                      800],
                                                              child: Icon(
                                                                  Icons.check),
                                                            ),
                                                            label: Text(e),
                                                            backgroundColor:
                                                                Colors
                                                                    .green[300],
                                                          ),
                                                        ))
                                                    .toList()),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Comments"),
                                ),
                                Column(
                                  children: post.comments!
                                      .map(
                                        (e) => CommentCard(comment: e),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                    );
                  }),
                ],
              )),
            ),
            Positioned(
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: CommentBox(
                controller: TextEditingController(),
                onSend: () {
                  //on send button pressed
                },
              ),
            )
          ],
        ));
  }
}
