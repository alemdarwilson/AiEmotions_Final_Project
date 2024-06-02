import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'emotion_detection_model.dart';
export 'emotion_detection_model.dart';

class EmotionDetectionWidget extends StatefulWidget {
  const EmotionDetectionWidget({super.key});

  @override
  State<EmotionDetectionWidget> createState() => _EmotionDetectionWidgetState();
}

class _EmotionDetectionWidgetState extends State<EmotionDetectionWidget> {
  late EmotionDetectionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EmotionDetectionModel());
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(12, 8, 0, 8),
      child: Container(
        width: 300,
        height: 600,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              color: Color(0x33000000),
              offset: Offset(
                0,
                1,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle,
          border: Border.all(
            color: Color(0xFFE0E3E7),
          ),
        ),
        child: StreamBuilder<List<DairyRecord>>(
          stream: queryDairyRecord(
            queryBuilder: (dairyRecord) => dairyRecord
                .where(
                  'userId',
                  isEqualTo: currentUserUid,
                )
                .orderBy('entryDate', descending: true),
            singleRecord: true,
          ),
          builder: (context, snapshot) {
            // Customize what your widget looks like when it's loading.
            if (!snapshot.hasData) {
              return Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      FlutterFlowTheme.of(context).primary,
                    ),
                  ),
                ),
              );
            }
            List<DairyRecord> columnDairyRecordList = snapshot.data!;
            // Return an empty Container when the item does not exist.
            if (snapshot.data!.isEmpty) {
              return Container();
            }
            final columnDairyRecord = columnDairyRecordList.isNotEmpty
                ? columnDairyRecordList.first
                : null;
            return Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          columnDairyRecord!.photoUrl,
                          width: 300,
                          height: 200,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 100),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                        child: Container(
                          width: 120,
                          height: 120,
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: Image.network(
                            () {
                              if (columnDairyRecord?.emotion == 'happy') {
                                return 'https://firebasestorage.googleapis.com/v0/b/group13-83de4.appspot.com/o/SmileyFace.png?alt=media&token=157d3adf-aef5-46a4-9a98-60dc810a7b2c';
                              } else if (columnDairyRecord?.emotion ==
                                  'angry') {
                                return 'https://firebasestorage.googleapis.com/v0/b/group13-83de4.appspot.com/o/AngryFace.png?alt=media&token=cf84e711-8526-474a-b4ba-3e95f4d42ad1';
                              } else if (columnDairyRecord?.emotion == 'sad') {
                                return 'https://firebasestorage.googleapis.com/v0/b/group13-83de4.appspot.com/o/Sad-face.png?alt=media&token=cb2b4c89-3db2-4c68-89e1-94ad4402ca9e';
                              } else {
                                return random_data.randomImageUrl(
                                  0,
                                  0,
                                );
                              }
                            }(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(30, 8, 0, 0),
                        child: Text(
                          valueOrDefault<String>(
                            columnDairyRecord?.emotion,
                            'Emotion',
                          ),
                          style: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Outfit',
                                letterSpacing: 0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      if (Navigator.of(context).canPop()) {
                        context.pop();
                      }
                      context.pushNamed('RecomendedFilm');
                    },
                    child: Container(
                      width: double.infinity,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Color(0xFF4B39EF),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Text(
                        'See Recommended Film',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    if (Navigator.of(context).canPop()) {
                      context.pop();
                    }
                    context.pushNamed('FilmSorgu');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      color: Color(0xFF4B39EF),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0),
                      ),
                    ),
                    alignment: AlignmentDirectional(0, 0),
                    child: Text(
                      'Select Film',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Plus Jakarta Sans',
                            color: Colors.white,
                            fontSize: 14,
                            letterSpacing: 0,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
