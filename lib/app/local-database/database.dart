import 'package:clean_architecture_project/app/todo/domain/entity/todo-item-entity.dart';
import 'package:moor/moor.dart';

part 'database.g.dart';

@DataClassName('TodoEntry')
class Todos extends Table {
  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get description => text()();
}

@UseMoor(
  tables: [Todos],
  queries: {'_getTodo': 'SELECT * FROM todos'},
)
class Database extends _$Database {
  Database(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 2;

  Future<void> insertRow({required TodoItemEntity todo}) {
    return into(todos).insert(new TodosCompanion(
        id: Value(todo.itemID),
        title: Value(todo.title),
        description: Value(todo.description)));

    // return _insertRow();
  }

  Stream<List<dynamic>> getStreamedTodoList() {
    return customSelect(
      'Select * FROM todos',
      readsFrom: {todos},
    ).map((row) {
      TodoItemEntity.fromMap(data: row.data);
    }).watch();
  }

  getTodo() async {
    print(2);
    List<TodoEntry> todo = await _getTodo().get();
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!${todo.length}");
  }
  // Future<void> deleteRow({required String itemId}){
  //   return customUpdate('');
  // }

  // @override
  // MigrationStrategy get migration {
  //   return MigrationStrategy(
  //     onCreate: (Migrator m) {
  //       return m.createAll();
  //     },
  //     onUpgrade: (Migrator m, int from, int to) async {
  //       if (from == 1) {
  //         await m.addColumn(todos, todos.targetDate);
  //       }
  //     },
  //     beforeOpen: (details) async {
  //       if (details.wasCreated) {
  //         // create default categories and entries
  //         final workId = await into(categories)
  //             .insert(const CategoriesCompanion(description: Value('Work')));

  //         await into(todos).insert(TodosCompanion(
  //           content: const Value('A first todo entry'),
  //           targetDate: Value(DateTime.now()),
  //         ));

  //         await into(todos).insert(
  //           TodosCompanion(
  //             content: const Value('Rework persistence code'),
  //             category: Value(workId),
  //             targetDate: Value(
  //               DateTime.now().add(const Duration(days: 4)),
  //             ),
  //           ),
  //         );
  //       }
  //     },
  //   );
  // }

  // Stream<List<CategoryWithCount>> categoriesWithCount() {
  //   // select all categories and load how many associated entries there are for
  //   // each category
  //   return customSelect(
  //     'SELECT c.id, c.desc, '
  //     '(SELECT COUNT(*) FROM todos WHERE category = c.id) AS amount '
  //     'FROM categories c '
  //     'UNION ALL SELECT null, null, '
  //     '(SELECT COUNT(*) FROM todos WHERE category IS NULL)',
  //     readsFrom: {todos, categories},
  //   ).map((row) {
  //     // when we have the result set, map each row to the data class
  //     final hasId = row.data['id'] != null;

  //     return CategoryWithCount(
  //       hasId ? Category.fromData(row.data, this) : null,
  //       row.read<int>('amount'),
  //     );
  //   }).watch();
  // }

  // Stream<List<EntryWithCategory>> watchEntriesInCategory(Category? category) {
  //   if (category != null) {
  //     final query = select(todos).join(
  //       [leftOuterJoin(categories, categories.id.equalsExp(todos.category))],
  //     )..where(categories.id.equals(category.id));

  //     return query.watch().map((rows) {
  //       // read both the entry and the associated category for each row
  //       return rows.map((row) {
  //         return EntryWithCategory(
  //           row.readTable(todos),
  //           row.readTable(categories),
  //         );
  //       }).toList();
  //     });
  //   }

  //   final query = select(todos)..where((t) => todos.category.isNull());

  //   return query.watch().map((rows) {
  //     // read both the entry and the associated category for each row
  //     return rows.map((row) {
  //       return EntryWithCategory(row, null);
  //     }).toList();
  //   });
  // }

  // Future<void> createEntry(TodosCompanion entry) async {
  //   final _todos = await (select(todos)
  //         ..orderBy([
  //           (u) => OrderingTerm(expression: u.id, mode: OrderingMode.desc),
  //         ]))
  //       .get();
  //   entry = entry.copyWith(id: Value(_todos.first.id + 1));
  //   return insertRow(cs, todos, entry);
  // }

  // Future updateEntry(TodoEntry entry) async {
  //   return updateRow(cs, todos, entry);
  // }

  // Future deleteEntry(TodoEntry entry) {
  //   return deleteRow(cs, todos, entry);
  // }

}
