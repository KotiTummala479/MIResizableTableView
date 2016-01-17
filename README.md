# MIResizableTableView
MIResizableTableView is a UITableView subclass that allows you to expand and contract its section.

# Overview
If you're familiar with UITableView you can notice that MIResizableTableView provides very similar methods

```
// MIResizableTableViewDataSource
- (NSInteger)numberOfSectionsInResizableTableView:(MIResizableTableView *)resizableTableView;
- (NSInteger)resizableTableView:(MIResizableTableView *)resizableTableView numberOfRowsInSection:(NSInteger)section;

- (UIView *)resizableTableView:(MIResizableTableView *)resizableTableView viewForHeaderInSection:(NSInteger)section;
- (UITableViewCell *)resizableTableView:(MIResizableTableView *)resizableTableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;

// MIResizableTableViewDelegate
- (CGFloat)resizableTableView:(MIResizableTableView *)resizableTableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)resizableTableView:(MIResizableTableView *)resizableTableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (void)resizableTableView:(MIResizableTableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

```

and here's the catch

```
- (UITableViewRowAnimation)resizableTableViewInsertRowAnimation;
- (UITableViewRowAnimation)resizableTableViewDeleteRowAnimation;

- (BOOL)resizableTableViewSectionShouldExpandSection:(NSInteger)section;
```

# Setup
- Add the MIResizableTableView to your project.
- Declare the tableview you want to be resizable as MIResizableTableView.
- Declare the MIResizableTableViewDataSource and the MIResizableTableViewDelegate.
- In the ViewController's viewDidLoad call configureWithDelegate:andDataSource:.

Briefly here's how your ViewController should be.

```
@interface ViewController () <MIResizableTableViewDataSource, MIResizableTableViewDelegate>

@property (nonatomic, weak) IBOutlet MIResizableTableView *tableView;

// some other properties

@end

@implementation ViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self.tableView configureWithDelegate:self andDataSource:self];
    
    // do stuff
}

// your methods

@end
```
# Demo
In this repository you can also find a demo.

<img src="demo.gif" height="500"/>
