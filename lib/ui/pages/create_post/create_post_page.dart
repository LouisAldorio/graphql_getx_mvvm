import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:graphql_getx_mvvm/ui/pages/create_post/create_post_view_model.dart';

class CreatePostForm extends GetView<CreatePostViewModel> {
  const CreatePostForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail"),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 400,
          alignment: Alignment.center,
          child: Form(
            key: controller.formKey,
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Title of your New Post",
                      labelText: "Title",
                      icon: Icon(Icons.title),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Content of your New Post",
                      labelText: "Content",
                      icon: Icon(Icons.content_copy),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    validator: (String? value) {
                      if (value != null && value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    child: Obx(() {
                      return controller.selectedAuthor.value == null
                          ? Text("Select Author")
                          : Text(controller.selectedAuthor.value!.name);
                    }),
                    onPressed: () {
                      controller.getAuthors();
                      Get.bottomSheet(
                        Obx(
                          () {
                            return Container(
                              color: Colors.white,
                              height: 300,
                              child: controller.isLoading.value
                                  ? Center(
                                      child: SpinKitWave(
                                        color: Colors.green,
                                        size: 40.0,
                                      ),
                                    )
                                  : ListView.builder(
                                      itemCount: controller
                                          .authorsResult.value.data!.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          leading: Container(
                                            margin: EdgeInsets.only(right: 8.0),
                                            width: 40,
                                            height: 40,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                              image: DecorationImage(
                                                  image: NetworkImage(
                                                      "https://source.unsplash.com/random/300x300/?girl"),
                                                  scale: 1.0,
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          title: Text(controller.authorsResult
                                              .value.data![index].name),
                                          onTap: () {
                                            controller.selectAuthor(controller
                                                .authorsResult
                                                .value
                                                .data![index]);
                                            Get.back();
                                          },
                                        );
                                      },
                                    ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (controller.formKey.currentState != null &&
                          controller.formKey.currentState!.validate()) {
                        controller.onSubmit().then((value) {
                          if(value.data != null) {
                            Get.back();
                          }else if(value.error != null) {
                            Get.snackbar(
                              "Error",
                              value.error!.message!,
                              backgroundColor: Colors.red,
                            );
                          }
                        });
                      }
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
