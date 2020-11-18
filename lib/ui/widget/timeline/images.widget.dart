import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:ndialog/ndialog.dart';
import 'package:portfolio/config/projects.config.dart';

// TODO: Remove this completely
class ImagesWidget extends StatelessWidget {
  const ImagesWidget({Key key, this.project}) : super(key: key);

  final ProjectData project;

  @override
  Widget build(BuildContext context) {
    // return ListView.builder(
    //   itemCount: project.screenshots.length,
    //   itemBuilder: (context, index) {
    String url =
        "https://images.unsplash.com/photo-1604050170221-aed634784f64?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=100&q=80";

    return Container();
    return InkWell(
      child: Image.network(
        url,
        height: 50,
        width: 50,
      ),
      onTap: () async {
        await NAlertDialog(
          dialogStyle: DialogStyle(titleDivider: true),
          // title: Text("Hi, This is NAlertDialog"),
          // content: Text("And here is your content, hoho... "),
          // content: Image.network(
          //   url,
          //   height: 50,
          //   width: 50,
          // ),
          content: Center(
            child: Swiper(
              containerHeight: 400,
              itemHeight: 300,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 500,
                  width: 500,
                  child: Image.network(
                    "http://via.placeholder.com/350x150",
                    fit: BoxFit.fitWidth,
                    width: 500,
                    height: 200,
                    cacheHeight: 300,
                    cacheWidth: 100,
                    loadingBuilder: (context, child, loadingProgress) =>
                        Container(),
                  ),
                );
              },
              itemCount: 3,
              pagination: SwiperPagination(),
              control: SwiperControl(),
            ),
          ),

          // actions: <Widget>[
          //   FlatButton(child: Text("You"), onPressed: () {}),
          //   FlatButton(child: Text("Are"), onPressed: () {}),
          //   FlatButton(child: Text("Awesome"), onPressed: () {}),
          // ],
          blur: 4,
        ).show(context);
      },
    );

    //   MaterialButton(
    //   child: Text("hey"),
    //   onPressed: () async {
    //
    //   },
    // )
    //   },
    // );
  }
}
