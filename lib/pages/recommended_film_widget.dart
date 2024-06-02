import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'recommended_film_model.dart';
export 'recommended_film_model.dart';

class RecomendedFilmWidget extends StatefulWidget {
  const RecomendedFilmWidget({super.key});

  @override
  State<RecomendedFilmWidget> createState() => _RecomendedFilmWidgetState();
}

class _RecomendedFilmWidgetState extends State<RecomendedFilmWidget> {
  late RecomendedFilmModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecomendedFilmModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: true,
          title: Text(
            'Recommended Films                ',
            textAlign: TextAlign.start,
            style: FlutterFlowTheme.of(context).titleMedium.override(
                  fontFamily: 'Readex Pro',
                  letterSpacing: 0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 4,
        ),
        body: SafeArea(
          top: true,
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
                children: [
                  Expanded(
                    child: StreamBuilder<List<FilmsRecord>>(
                      stream: queryFilmsRecord(
                        queryBuilder: (filmsRecord) => filmsRecord.where(
                          'Genre',
                          isEqualTo: () {
                            if (columnDairyRecord?.emotion == 'happy') {
                              return 'Comedy';
                            } else if (columnDairyRecord?.emotion == 'sad') {
                              return 'Horror';
                            } else if (columnDairyRecord?.emotion == 'angry') {
                              return 'Action';
                            } else {
                              return '*';
                            }
                          }(),
                        ),
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
                        List<FilmsRecord> containerFilmsRecordList =
                            snapshot.data!;
                        return Container(
                          width: 390,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Builder(
                            builder: (context) {
                              final filmList1 =
                                  containerFilmsRecordList.toList();
                              return FlutterFlowDataTable<FilmsRecord>(
                                controller: _model.paginatedDataTableController,
                                data: filmList1,
                                columnsBuilder: (onSortChanged) => [
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Title',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Genre',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Premier',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'Runtime',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    ),
                                  ),
                                  DataColumn2(
                                    label: DefaultTextStyle.merge(
                                      softWrap: true,
                                      child: Text(
                                        'IMDB',
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Readex Pro',
                                              letterSpacing: 0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ],
                                dataRowBuilder: (filmList1Item, filmList1Index,
                                        selected, onSelectChanged) =>
                                    DataRow(
                                  color: MaterialStateProperty.all(
                                    filmList1Index % 2 == 0
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                  ),
                                  cells: [
                                    Text(
                                      filmList1Item.title,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                    Text(
                                      filmList1Item.genre,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                    Text(
                                      filmList1Item.premiere,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                    Text(
                                      filmList1Item.runtime.toString(),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                    Text(
                                      filmList1Item.iMDBScore,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Readex Pro',
                                            letterSpacing: 0,
                                          ),
                                    ),
                                  ].map((c) => DataCell(c)).toList(),
                                ),
                                paginated: true,
                                selectable: false,
                                hidePaginator: false,
                                showFirstLastButtons: false,
                                headingRowHeight: 56,
                                dataRowHeight: 48,
                                columnSpacing: 20,
                                headingRowColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: BorderRadius.circular(8),
                                addHorizontalDivider: true,
                                addTopAndBottomDivider: false,
                                hideDefaultHorizontalDivider: true,
                                horizontalDividerColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                horizontalDividerThickness: 1,
                                addVerticalDivider: false,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
