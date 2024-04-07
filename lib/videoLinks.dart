import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainig/components/customTextField.dart';
import 'package:url_launcher/url_launcher.dart';
import 'model/prov.dart';

class videoLinksPage extends StatefulWidget {
  const videoLinksPage({super.key});
  @override
  State<videoLinksPage> createState() => _videoLinksPageState();
}

class _videoLinksPageState extends State<videoLinksPage> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<prov>(context, listen: false).getVideo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "VIEW VIDEO LINKS",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Consumer<prov>(
        builder: (context, value, child) {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                customTextField(
                    hinttext: "Search...",
                    mycontroller: search,
                    keboardType: TextInputType.text,
                    isPassword: false,
                    color: Colors.grey.shade200),
                const SizedBox(
                  height: 20,
                ),
                (value.isLoading[2])
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 20,
                        children: List.generate(value.VIDEO.length, (index) {
                          final Videoes = value.VIDEO;
                          return InkWell(
                            onTap: () async {
                              if (!await launchUrl(
                                  Uri.parse(Videoes[index].url))) {
                                throw Exception(
                                    'Could not launch ${Videoes[index].url}');
                              }
                            },
                            child: GridTile(
                              header: Column(
                                children: [
                                  Image(
                                      width: 120,
                                      height: 120,
                                      image:
                                          NetworkImage(Videoes[index].image)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    Videoes[index].title,
                                    style: const TextStyle(
                                      color: Colors.blue,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              footer: Text(
                                Videoes[index].description,
                                style: TextStyle(
                                  color: Colors.grey.shade400,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              child: Container(),
                            ),
                          );
                        }),
                      )),
              ],
            ),
          );
        },
      ),
    );
  }
}
