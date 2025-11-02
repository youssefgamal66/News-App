import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news/module/card/pages/web_view_screen.dart';
import 'package:news/module/home/widget/card_list.dart';
import 'package:news/view_model/news_view_model.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatefulWidget {
  final CardList? cardList;

  const CardScreen({super.key, this.cardList});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen>
    with SingleTickerProviderStateMixin {
  int selectedTab = 0;
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    context
        .read<NewsViewModel>()
        .getSource(widget.cardList?.id ?? "")
        .then((_) {
      final viewModel = context.read<NewsViewModel>();
      if (viewModel.sources.isNotEmpty) {
        viewModel.getNews(viewModel.sources[0].id ?? "");
      }
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.cardList?.name ?? "All News",
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Consumer<NewsViewModel>(
        builder: (context, vm, child) {
          if (vm.isLoadingSources) {
            return const Center(child: CircularProgressIndicator());
          }

          if (vm.sources.isEmpty) {
            return const Center(
              child: Text(
                "No Sources Found!",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          _tabController ??= TabController(
            length: vm.sources.length,
            vsync: this,
            initialIndex: selectedTab,
          );

          _tabController!.removeListener(() => _handleTabChange(vm));
          _tabController!.addListener(() => _handleTabChange(vm));

          return Column(
            children: [
              TabBar(
                controller: _tabController,
                isScrollable: true,
                tabAlignment: TabAlignment.start,
                dividerColor: Colors.transparent,
                indicatorColor: Colors.white,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.white70,
                tabs: vm.sources.map((e) {
                  return Tab(text: e.name ?? "");
                }).toList(),
              ),
              Expanded(
                child: Builder(
                  builder: (context) {
                    if (vm.isLoadingArticles) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (vm.articles.isEmpty) {
                      return const Center(
                        child: Text(
                          "No Articles Found!",
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }

                    return ListView.builder(
                      itemCount: vm.articles.length,
                      itemBuilder: (context, i) {
                        final article = vm.articles[i];

                        return InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              backgroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              isScrollControlled: true,
                              builder: (context) {
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        if (article.urlToImage != null)
                                          ClipRRect(
                                            borderRadius:
                                            BorderRadius.circular(12),
                                            child: Image.network(
                                              article.urlToImage!,
                                              errorBuilder: (context, error,
                                                  stackTrace) {
                                                return const Icon(Icons.error,
                                                    color: Colors.red);
                                              },
                                            ),
                                          ),
                                        const SizedBox(height: 12),
                                        Text(
                                          article.title ?? "No title",
                                          style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black,
                                          ),
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          article.description ??
                                              "No description available.",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
                                          ),
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox(
                                          width: double.infinity,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.black,
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  vertical: 12),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(10),
                                              ),
                                            ),
                                            onPressed: () {
                                              final url = article.url;
                                              if (url != null) {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        WebViewScreen(url: url),
                                                  ),
                                                );
                                              } else {
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(
                                                  const SnackBar(
                                                    content: Text(
                                                        "No URL available for this article"),
                                                  ),
                                                );
                                              }
                                            },
                                            child: const Text(
                                              "View All",
                                              style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (article.urlToImage != null)
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      article.urlToImage!,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.error,
                                            color: Colors.red);
                                      },
                                    ),
                                  ),
                                const SizedBox(height: 10),
                                Text(
                                  article.title ?? "",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Row(
                                  children: [
                                    if (article.author != null)
                                      Expanded(
                                        child: Text(
                                          "by: ${article.author!}",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    const SizedBox(width: 10),
                                    Text(
                                      DateFormat("E, dd MMM").format(
                                        DateTime.tryParse(
                                          article.publishedAt ?? '',
                                        ) ??
                                            DateTime.now(),
                                      ),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _handleTabChange(NewsViewModel vm) {
    if (_tabController!.indexIsChanging) return;

    setState(() {
      selectedTab = _tabController!.index;
    });

    vm.getNews(vm.sources[selectedTab].id ?? "");
  }
}
