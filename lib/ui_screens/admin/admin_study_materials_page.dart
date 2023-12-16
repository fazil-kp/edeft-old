import 'package:edeft/ui_screens/admin/admin_home_page.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:url_launcher/url_launcher.dart';


class AdminStudyMaterialsPage extends StatefulWidget {
  const AdminStudyMaterialsPage({Key? key}) : super(key: key);

  @override
  State<AdminStudyMaterialsPage> createState() => _AdminStudyMaterialsPageState();
}

class _AdminStudyMaterialsPageState extends State<AdminStudyMaterialsPage> {

  final List<String> _topicList=[];
  final List<String> _subList=[];
  final List<String?> _urlList=[];

  List<PlatformFile?> filesList= [];

  void _setValue(String topic,String sub,String? url,PlatformFile? file) {
    setState(() {
      _topicList.add(topic);
      _subList.add(sub);
      _urlList.add(url);
      filesList.add(file);

    });
  }

  Future<void> _launchUrl(String i) async {
    var uri = i;
    var linker =Uri.parse(uri);
    if (await canLaunchUrl(linker)) {
      await launchUrl(linker);
    } else {
      throw 'Could not launch $linker';
    }
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialogBox(setValue: _setValue);
        });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        leading:IconButton(onPressed: (){
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => const AdminHomePage()));
        },
            icon: const Icon(Icons.arrow_back, color: Colors.black,)
        ),
        title: const Text('Study Materials',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
        centerTitle: true,
        backgroundColor: const Color(0xFFfafafa),
        //Theme.of(context).accentColor,
        elevation: 0,

      ),
      body:_topicList.isEmpty? Center(
        child: RichText(
          text: const TextSpan(
              text: "You haven't added any ",
              style: TextStyle(color: Colors.black87),
              children: [
                TextSpan(
                  text: 'Study Materials',
                  style: TextStyle(color: Colors.red),
                ),
                TextSpan(
                  text: ' yet.',
                  style: TextStyle(color: Colors.black87),
                )
              ]
          ),
        ),
      ):
      ListView.builder(
          itemCount: _topicList.length,
          itemBuilder:  (BuildContext context,int index) {
            return ListTile(
              title: GestureDetector(
                onTap: () =>(_urlList[index]==null)? openFile(filesList[index]!):_launchUrl(_urlList[index]!),
                child: Card(
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceBetween,
                      children: [
                        Wrap(
                          direction: Axis.horizontal,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          spacing: 17.0,
                          children: [
                            const CircleAvatar(
                              backgroundImage: NetworkImage('https://i.postimg.cc/sxWrSpJZ/image.png'),
                              backgroundColor: Colors.white,
                              radius: 40,
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 17, 0, 7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    _topicList[index],
                                    style: const TextStyle(fontWeight: FontWeight.w800,fontSize: 22),
                                  ),
                                  Text(
                                    _subList[index],
                                    style: const TextStyle(color: Color(0xFF404040)),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        IconButton(
                            onPressed: (){
                              setState(() {
                                _topicList.removeAt(index);
                                _subList.removeAt(index);
                                _urlList.removeAt(index);
                                filesList.removeAt(index);
                              });
                            },
                            icon: const Icon(Icons.delete))
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black87 ,
        onPressed: (){
          _showDialog();
        },
        child: const Icon(Icons.add),),
    );
  }

  void openFile(PlatformFile file){
    OpenFile.open(file.path!);
  }
}

class AlertDialogBox extends StatefulWidget {

  final Function(String,String,String?,PlatformFile?) setValue;

  const AlertDialogBox({Key? key,
    required this.setValue
  }) : super(key: key);

  @override
  State<AlertDialogBox> createState() => _AlertDialogBoxState();
}

class _AlertDialogBoxState extends State<AlertDialogBox> {
  TextEditingController topicController = TextEditingController();
  TextEditingController subController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  FilePickerResult? result;

  bool _isUploadButtonVisible=true;
  bool _isUrlFieldVisible=true;
  String uploadStatus= "Upload File";
  Color urlColor = Colors.white;
  Color uploadColor = Colors.white;

  String topicLists='';
  String subLists='';
  String? urlLists;
  PlatformFile? fileList;

  void _updateList(){
    widget.setValue(topicLists,subLists,urlLists,fileList);
  }

  Future<void> _pickFile() async {

    result = await FilePicker.platform.pickFiles(
        withReadStream: true,
        allowMultiple: false,
        type: FileType.custom,
        allowedExtensions: ['pdf','docx','doc','xls','xlsx']
    );

    final isSelected = result;
    // if (result == null) return;
    if(isSelected!=null){
      setState(() {
        _isUrlFieldVisible = false;
        _isUploadButtonVisible = true;
        (_isUrlFieldVisible==false)?urlColor=const Color(0XFFd9d9d9):urlColor=Colors.white;

        uploadStatus="File Selected ✔️";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      actionsPadding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
      backgroundColor: const Color(0XFF00b2ff),
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      contentPadding: const EdgeInsets.all(20),
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12,),
                TextField(
                  controller: topicController,
                  maxLines: 2,
                  decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  controller: subController,
                  decoration: InputDecoration(
                    labelText: 'Subject',
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                TextField(
                  enabled: _isUrlFieldVisible,
                  controller: urlController,
                  onChanged: (value) {
                    setState(() {
                      _isUploadButtonVisible = value.isEmpty;
                      _isUrlFieldVisible = true;
                      _isUploadButtonVisible==false?uploadColor=const Color(0XFF006e9e):uploadColor=Colors.white;
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Url',
                    hintText: "paste complete url with https",
                    labelStyle: const TextStyle(color: Colors.black54),
                    filled: true,
                    fillColor: urlColor,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                const Text('or',style: TextStyle(color: Colors.white),),
                Column(
                  children: [
                    IconButton(
                      onPressed: _isUploadButtonVisible ? _pickFile : null,
                      icon: Icon(Icons.add_circle,color:uploadColor,),),
                    Text(uploadStatus,
                      style: TextStyle(color: uploadColor),),
                  ],
                )
              ],
            );
          }
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.white),
          child: const Text('Cancel',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.white),
          child: const Text("Submit",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
          onPressed: () {
            Navigator.pop(context);
            String topic = topicController.text;
            String sub = subController.text;
            String url = urlController.text;
            setState(() {

              _isUploadButtonVisible=true;
              _isUrlFieldVisible=true;
              uploadStatus="Upload File";

              if (topic.isNotEmpty&&sub.isNotEmpty&&(url.isNotEmpty||result!.files.isNotEmpty))
              {
                topicLists = topic;
                subLists = sub;
                if(url.isEmpty)
                {
                  urlLists = null;
                  setState(() {
                    fileList =result!.files[0];
                  });
                }
                else{
                  urlLists=url;
                  fileList = null;
                }

                subController.text="";
                topicController.text="";
                urlController.text="";
                result=null;
                _updateList();
              }
              else {
                subController.text="";
                topicController.text="";
                urlController.text="";
                result=null;
              }
            });
          },
        ),
      ],
    );
  }
}
