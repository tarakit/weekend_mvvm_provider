import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:weekend_provider/data/response/status.dart';
import 'package:weekend_provider/models/article.dart';

import '../../view_model/article_view_model.dart';

class AddArticle extends StatefulWidget {
  AddArticle({Key? key}) : super(key: key);

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  File? imageFile;
  var imageId;
  ArticleViewModel articleViewModel = ArticleViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add_a_photo),
            onPressed: () {
              _getImageFromGalleryOrCamera("camera");
            },
          ),
          SizedBox(
            width: 5,
          ),
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () {
              _getImageFromGalleryOrCamera("gallery");
            },
          ),
          SizedBox(
            width: 5,
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) => articleViewModel,
            child: Consumer<ArticleViewModel>(
              builder: (create, value, _){
                print('success posted ${value.articleResponse}');
                return IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    Attributes data = Attributes(title: 'abc', content: 'asdfsd');
                    articleViewModel.postArticle(data, 45);
                  },
                );
              },
            ),
          ),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: Column(
        children: [
          ChangeNotifierProvider<ArticleViewModel>(
            create: (BuildContext context) => articleViewModel,
            child: Consumer<ArticleViewModel>(
                builder: (context, articleViewModel, _) {
                  // imageId = articleViewModel.imageResponse;
                  print('imageid ${articleViewModel.imageResponse}');
              return Container(
                child: imageFile != null
                    ? Image.file(imageFile!)
                    : Image.network(
                    'https://www.pngkey.com/png/detail/233-2332677_image-500580-placeholder-transparent.png'),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
              );
            }),
          ),
          TextField(
            decoration: InputDecoration(
                label: Text('input title here'), border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            decoration: InputDecoration(
                label: Text('input content here'),
                border: OutlineInputBorder()),
          )
        ],
      ),
    );
  }

  _getImageFromGalleryOrCamera(String type) async {
    print("type $type");
    PickedFile? pickedFile = await ImagePicker().getImage(
        source: type == "camera" ? ImageSource.camera : ImageSource.gallery,
        // source: ImageSource.gallery,
        maxHeight: 1700,
        maxWidth: 1700);

    if (pickedFile != null) {
      imageFile = File(pickedFile.path);
      articleViewModel.uploadImage(imageFile);
      // setState(() {
      //   imageFile = File(pickedFile.path);
      // });
    }
  }
}
