import 'package:flutter/material.dart';
import 'package:noticias/model/article_model.dart';
import 'package:noticias/pages/articles_details_page.dart';

Widget customListTile(Article article, BuildContext context, int index) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ArticlePage(
                    article: article,
                  )));
    },
    child: Container(
      margin: EdgeInsets.all(12.0),
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3.0,
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Center(
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                  ),
                  child: Text(
                    "$index" + ".",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Text(
                    article.source.name ?? "",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              //let's add the height
              image: DecorationImage(
                  image: NetworkImage(article.urlToImage ?? ""),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.star_outline),
                  ),
                ),
              ),
              Center(
                child: Container(
                  width: 100.0,
                  height: 40.0,
                  margin: const EdgeInsets.only(left: 5.0, right: 5.0),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: IconButton(
                    onPressed: null,
                    icon: Icon(Icons.info_outline),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(
            article.title ?? "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
              color: Colors.black,
            ),
          )
        ],
      ),
    ),
  );
}
