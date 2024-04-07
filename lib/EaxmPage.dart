import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:trainig/components/customButton.dart';
import 'package:trainig/components/customTextField.dart';
import 'package:trainig/components/examDetails.dart';
import 'components/zoomDetails.dart';
import 'model/prov.dart';

class examLinksPage extends StatefulWidget {
  const examLinksPage({super.key});
  @override
  State<examLinksPage> createState() => _examLinksPageState();
}

class _examLinksPageState extends State<examLinksPage> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<prov>(context, listen: false).getExam();
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
          "Exams",
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
                (model.isLoading[3])
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: ListView.builder(
                            itemCount: model.EXAM.length,
                            itemBuilder: (context, index) {
                              final exam = model.EXAM;
                              final time =
                                  "${TimeOfDay.fromDateTime(DateTime.parse(exam[index].time)).hourOfPeriod}:${TimeOfDay.fromDateTime(DateTime.parse(exam[index].time)).minute} ${TimeOfDay.fromDateTime(DateTime.parse(exam[index].time)).period.name.toUpperCase()}";
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
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.calendar_month,
                                              color: Colors.blue,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  exam[index]
                                                      .date
                                                      .substring(0, 10),
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.grey.shade500,
                                                  )),
                                            ),
                                            const Icon(
                                                color: Colors.blue,
                                                Icons.watch_later_outlined),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(time,
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
                                            const Icon(
                                              Icons.document_scanner,
                                              color: Colors.blue,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(exam[index].title,
                                                  style: const TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.keyboard_double_arrow_right,
                                              color: Colors.blue,
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                              child: Text(
                                                  exam[index].description,
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
                                                          examDetails(
                                                              title: exam[index]
                                                                  .title,
                                                              description: exam[
                                                                      index]
                                                                  .description,
                                                              url: exam[index]
                                                                  .url,
                                                              date: exam[index]
                                                                  .date
                                                                  .substring(
                                                                      0, 10),
                                                              time: time)));
                                            },
                                            title: "VIEW EXAM",
                                            color: Colors.blue,
                                            width: 200)
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
