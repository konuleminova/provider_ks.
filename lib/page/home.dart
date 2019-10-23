import 'package:flutter/material.dart';
import 'package:flutter_kendden_shehere/viewmodel/home_viewmodel.dart';
import 'package:flutter_kendden_shehere/widgets/glistitem1.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  String title;
  double height;
  double width;

  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false).getHomeProducts();
  }

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width=MediaQuery.of(context).size.width;
    // TODO: implement build
    return Consumer<HomeViewModel>(builder: (context, viewModel, child) {
      return Scaffold(body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              new Wrap(children: <Widget>[
                // _buildCarousel(),
                viewModel.homeList.homelist != null
                    ? ListView.builder(
                    shrinkWrap: true,
                    physics: ClampingScrollPhysics(),
                    itemCount: viewModel.homeList.homelist.length,
                    itemBuilder: (
                        BuildContext context,
                        int index,
                        ) {
                      String langCode =
                          Localizations.localeOf(context).languageCode;
                      if (langCode == "tr") {
                        title =
                            viewModel.homeList.homelist[index].name_az.trim();
                      } else if (langCode == "en") {
                        title =
                            viewModel.homeList.homelist[index].name_en.trim();
                      } else if (langCode == "ru") {
                        title =
                            viewModel.homeList.homelist[index].name_ru.trim();
                      }
                      return Container(
                          child: Column(
                            children: <Widget>[
                              _titleContainer(title),
                              Container(
                                child: ListView.builder(
                                    physics: ClampingScrollPhysics(),
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: viewModel
                                        .homeList.homelist[index].list.length,
                                    itemBuilder:
                                        (BuildContext context, int index2) {
                                      return Container(
                                        height: height * 0.5,
                                        child: Column(
                                          children: <Widget>[
                                            Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                    0.5,
                                                height: height * 0.5,
                                                child: InkWell(
                                                    child: Container(
                                                        child: InkWell(
                                                          child: GroceryListItemOne(
                                                            product: viewModel
                                                                .homeList
                                                                .homelist[
                                                            index]
                                                                .list[index2],
                                                          ),
                                                        ))))
                                          ],
                                        ),
                                      );
                                    }),
                                height: height * 0.5,
                              )
                            ],
                          ));
                    })
                    : Container(
                  child: CircularProgressIndicator(),
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 100),
                ),
              ])
            ],
          )),);
    });
  }

  _titleContainer(String title) => new Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10),
        height: 60,
        color: Colors.grey[200],
        child: new Stack(
          children: <Widget>[
            new Container(
              child: new Text(
                title,
                textAlign: TextAlign.left,
                style: new TextStyle(fontSize: 20, color: Colors.green),
              ),
              alignment: AlignmentDirectional.centerStart,
            ),
          ],
        ),
      );
}
