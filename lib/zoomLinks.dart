import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:trainig/components/customButton.dart';
import 'package:trainig/components/customTextField.dart';
import 'components/zoomDetails.dart';
import 'model/prov.dart';

class zoomLinksPage extends StatefulWidget {
  const zoomLinksPage({super.key});
  @override
  State<zoomLinksPage> createState() => _zoomLinksPageState();
}

class _zoomLinksPageState extends State<zoomLinksPage> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<prov>(context, listen: false).getZoom();
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
          "VIEW ZOOM LINKS",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Consumer<prov>(
        builder: (context, model, child) {
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
                (model.isLoading[1])
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: ListView.builder(
                            itemCount: model.ZOOM.length,
                            itemBuilder: (context, index) {
                              final zoom = model.ZOOM;
                              return Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(Icons.calendar_month),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  zoom[index]
                                                      .date
                                                      .substring(0, 10),
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey.shade500,
                                                  )),
                                            ),
                                            const Icon(
                                                Icons.watch_later_outlined),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                                zoom[index]
                                                    .date
                                                    .substring(0, 10),
                                                style: TextStyle(
                                                  fontSize: 15,
                                                  color: Colors.grey.shade500,
                                                )),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.document_scanner),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(zoom[index].title,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(Icons
                                                .keyboard_double_arrow_right),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  zoom[index].description,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey.shade500,
                                                  )),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 30,
                                        ),
                                        customButtons(
                                            onPressed: () async {
                                              Navigator.push(
                                                  context,
                                                  CupertinoPageRoute(
                                                      builder: (context) =>
                                                          zoomDetails(
                                                            date: zoom[index]
                                                                .date,
                                                            title: zoom[index]
                                                                .title,
                                                            url:
                                                                zoom[index].url,
                                                            description: zoom[
                                                                    index]
                                                                .description,
                                                            image: zoom[index]
                                                                .image,
                                                          )));
                                            },
                                            title: "VIEW ZOOM",
                                            color: Colors.blue,
                                            width: 230)
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                ],
                              );
                            }),
                      )
              ],
            ),
          );
        },
      ),
    );
  }
}
