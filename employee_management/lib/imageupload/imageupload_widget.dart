import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/upload_media.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ImageuploadWidget extends StatefulWidget {
  const ImageuploadWidget({Key? key}) : super(key: key);

  @override
  _ImageuploadWidgetState createState() => _ImageuploadWidgetState();
}

class _ImageuploadWidgetState extends State<ImageuploadWidget> {
  bool isMediaUploading = false;
  Uint8List uploadedFileBytes = Uint8List.fromList([]);

  ApiCallResponse? apiResultdhy;
  TextEditingController? textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
  }

  @override
  void dispose() {
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        automaticallyImplyLeading: false,
        title: Text(
          'Page Title',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Poppins',
                color: Colors.white,
                fontSize: 22,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: TextFormField(
            controller: textController,
            onFieldSubmitted: (_) async {
              var _shouldSetState = false;
              final selectedMedia = await selectMediaWithSourceBottomSheet(
                context: context,
                allowPhoto: true,
              );
              if (selectedMedia != null &&
                  selectedMedia.every(
                      (m) => validateFileFormat(m.storagePath, context))) {
                setState(() => isMediaUploading = true);
                var selectedMediaBytes = <Uint8List>[];
                try {
                  showUploadMessage(
                    context,
                    'Uploading file...',
                    showLoading: true,
                  );
                  selectedMediaBytes =
                      selectedMedia.map((m) => m.bytes).toList();
                } finally {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  isMediaUploading = false;
                }
                if (selectedMediaBytes.length == selectedMedia.length) {
                  setState(() => uploadedFileBytes = selectedMediaBytes.first);
                  showUploadMessage(context, 'Success!');
                } else {
                  setState(() {});
                  showUploadMessage(context, 'Failed to upload media');
                  return;
                }
              }

              apiResultdhy = await LoginRegisterGroup.uploadeImageCall.call(
                productImage: textController!.text,
                accessToken: FFAppState().AccessToken,
              );
              _shouldSetState = true;
              if (!(apiResultdhy?.succeeded ?? true)) {
                if (_shouldSetState) setState(() {});
                return;
              }
              if (_shouldSetState) setState(() {});
            },
            autofocus: true,
            obscureText: false,
            decoration: InputDecoration(
              hintText: '[Some hint text...]',
              hintStyle: FlutterFlowTheme.of(context).bodyText2,
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0x00000000),
                  width: 1,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4.0),
                  topRight: Radius.circular(4.0),
                ),
              ),
            ),
            style: FlutterFlowTheme.of(context).bodyText1,
          ),
        ),
      ),
    );
  }
}
