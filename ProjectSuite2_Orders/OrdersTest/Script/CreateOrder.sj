function Main()
{
  var  orders;
  var  mainForm;
  var  orderForm;
  var  groupBox;
  var  numericUpDown;
  var  dateTimePicker;
  var  textBox;
  var  listView;
  var  dlgConfirmation;
  RunOrders()
  var file = Files.FileNameByName("Orders_data.txt");
  Log.Message("Creating driver");
  var driver = DDT.CSVDriver(file);
  while (!driver.EOF())
{
  CreateOrder(driver, groupBox, mainForm, orders, orderForm);
  driver.Next();
}
  DDT.CloseDriver(file);
  DeleteOrder(mainForm, driver, orders);
  CloseOrders(mainForm);
}
  
  function RunOrders()
{
  TestedApps.Orders.Run();
}

  function CreateOrder(driver, groupBox, mainForm, orders, orderForm) 
{
  orders = Aliases.Orders;
  mainForm = orders.MainForm;
  mainForm.MainMenu.Click("Orders|New order...");
  //Fill in Order form
  orderForm = orders.OrderForm;
  groupBox = orderForm.Group;
  groupBox.ProductNames.ClickItem(driver.Value(1));
  numericUpDown = groupBox.Quantity;
  numericUpDown.UpDownEdit.Drag(9, 7, -9, 0);
  numericUpDown.wValue = driver.Value(2);
  dateTimePicker = groupBox.Date;
  dateTimePicker.wDate = "3/6/2005";
  dateTimePicker.wDate = "3/27/2005";
  dateTimePicker.wDate = driver.Value(3);
  textBox = groupBox.Customer;
  textBox.Click(37, 10);
  textBox.wText = driver.Value(0);
  textBox = groupBox.Street;
  textBox.Click(34, 5);
  textBox.wText = driver.Value(4);
  textBox = groupBox.City;
  textBox.Click(30, 10);
  textBox.wText = driver.Value(5);
  textBox = groupBox.State;
  textBox.Click(86, 17);
  textBox.wText = driver.Value(6);
  textBox = groupBox.Zip;
  textBox.Click(32, 8);
  textBox.wText = driver.Value(7);
  groupBox.WinFormsObject(driver.Value(8)).ClickButton();
  textBox = groupBox.CardNo;
  textBox.Click(16, 12);
  textBox.wText = driver.Value(9);
  dateTimePicker = groupBox.ExpDate;
  dateTimePicker.wDate = "8/6/2005";
  dateTimePicker.wDate = "8/3/2005";
  dateTimePicker.wDate = driver.Value(10);
  //Create checkpoint
  aqObject.CompareProperty(Aliases.Orders.OrderForm.Group.Customer.wText, cmpEqual, driver.Value(0), false);
  //Close Order form
  orderForm.ButtonOK.ClickButton();
}

  function DeleteOrder(mainForm, driver, orders)
{  
  orders = Aliases.Orders;
  mainForm = orders.MainForm;
  listView = mainForm.OrdersView;
  listView.ClickItemR(driver.Value(0), 0);
  listView.PopupMenu.Click("Delete order");
  dlgConfirmation = orders.dlgConfirmation;
  dlgConfirmation.btnYes.ClickButton();
}
  function CloseOrders(mainForm, dlgConfirmation)
{
  orders = Aliases.Orders;
  mainForm = orders.MainForm;
  mainForm.Close();
  dlgConfirmation.btnNo.ClickButton();
}