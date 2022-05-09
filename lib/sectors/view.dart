import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GFAppBar(
        searchBar: true,
        title: const Text("Sector"),
        actions: <Widget>[
          GFIconButton(
            icon: const Icon(
              Icons.add_rounded,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed("/add");
            },
            type: GFButtonType.transparent,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.start,
            image: Image.asset(
              'assets/images/ace-1869825_1920.jpg',
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            showImage: true,
            title: const GFListTile(
              avatar: GFAvatar(
                backgroundImage:
                    AssetImage('assets/images/ace-1869825_1920.jpg'),
              ),
              titleText: 'Game Controllers',
            ),
            content: const Text(
                "Some quick example text to build on the card,Some quick example text to build on the card"),
            buttonBar: GFButtonBar(
              children: <Widget>[
                FloatingActionButton(
                  backgroundColor: GFColors.SUCCESS, // first FAB to perform decrement 
                  onPressed: () {
                    Navigator.of(context).pushNamed("/edit");
                  },
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    ),
                ),
                const GFAvatar(
                  backgroundColor: GFColors.DANGER,
                  child: Icon(
                    Icons.delete,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
