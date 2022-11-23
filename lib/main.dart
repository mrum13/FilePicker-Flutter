import 'package:file_picker/file_picker.dart';
import 'package:file_picker_flutter/cubit/file_name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: ((context) => FileNameCubit())),
      ],
      child: MaterialApp(
        title: 'Flutter File Picker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    FilePickerResult? result;
    String fileName = "";
    PlatformFile pickedFile;

    void pickFile() async {
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: false,
      );

      if (result != null) {
        fileName = result!.files.first.name;
        context.read<FileNameCubit>().setFileName(fileName: fileName);

        pickedFile = result!.files.first;
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                pickFile();
              },
              child: Container(
                color: Colors.blue,
                margin: const EdgeInsets.all(24),
                padding: const EdgeInsets.all(16),
                width: double.infinity,
                child: const Text(
                  "Pilih File",
                  style: TextStyle(fontSize: 14, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            BlocBuilder<FileNameCubit, String>(
              builder: (context, state) {
                return Text(state == "Pilih file..." ? "Pilih file..." : state);
              },
            )
          ],
        ),
      ),
    );
  }
}
