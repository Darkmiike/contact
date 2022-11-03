import 'dart:convert';

import 'package:contact/models/photos_models.dart';
import 'package:contact/models/users_models.dart';
import 'package:contact/util/widgets_util.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future fetchUser() async {
    final response = await http.get(
      fetchUserFunc('http://jsonplaceholder.typicode.com/users'),
    );

    List<Users> user = [];

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      for (var people in json) {
        Users addUser = Users.fromJson(people);
        user.add(addUser);
      }
    } else {
      throw Exception('Failed to load users');
    }

    return user;
  }

  Future fetchPhotos() async {
    final response = await http
        .get(fetchUserFunc('http://jsonplaceholder.typicode.com/photos'));
    List<Photo> images = [];
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      for (var pics in json) {
        images.add(Photo.fromJson(pics));
      }
    } else {
      throw Exception('Failed to load photos');
    }
    return images;
  }

  @override
  void initState() {
    super.initState();
    fetchPhotos();
    fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: textInfo('Contacts', FontWeight.bold, Colors.white, 24),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add_box_rounded,
                size: 30,
              ),
              color: Colors.white,
            ),
          )
        ],
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextField(
                style: TextStyle(color: Colors.grey.shade500),
                decoration: InputDecoration(
                  labelStyle: TextStyle(color: Colors.grey.shade500),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.grey.shade500,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.grey.shade500),
                  filled: true,
                  fillColor: const Color.fromARGB(50, 255, 255, 255),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                children: [
                  textInfo('Favorites', FontWeight.normal, Colors.white, 14)
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              clipBehavior: Clip.none,
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: FutureBuilder(
                future: fetchPhotos(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.only(right: 10),
                          clipBehavior: Clip.none,
                          child: Column(
                            children: [
                              profileImage(snapshot.data[index].url),
                              const SizedBox(
                                height: 5,
                              ),
                              textInfo(snapshot.data[index].id.toString(),
                                  FontWeight.w700, Colors.white, 10)
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 600,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: FutureBuilder(
                future: fetchUser(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: const ListTile(),
                        );
                      },
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
