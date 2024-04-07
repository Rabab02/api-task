import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trainig/components/customTextField.dart';
import 'components/bookDetails.dart';
import 'model/prov.dart';

class bookLinksPage extends StatefulWidget {
  const bookLinksPage({super.key});
  @override
  State<bookLinksPage> createState() => _bookLinksPageState();
}

class _bookLinksPageState extends State<bookLinksPage> {
  TextEditingController search = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<prov>(context, listen: false).getAllBooks();
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
          "VIEW BOOK LINKS",
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
                (value.isLoading[0])
                    ? const CircularProgressIndicator()
                    : Expanded(
                        child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 30,
                        children: List.generate(value.BOOKS.length, (index) {
                          final book = value.BOOKS;
                          return InkWell(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  CupertinoPageRoute(
                                      builder: (context) => bookDetails(
                                            title: book[index].title,
                                            url: book[index].url,
                                            description:
                                                book[index].description,
                                            image: book[index].image,
                                          )));
                            },
                            child: GridTile(
                              header: Image(
                                  height: 130,
                                  width: 130,
                                  image: NetworkImage(book[index].image)),
                              footer: Text(book[index].title,
                                  style: const TextStyle(color: Colors.blue)),
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
