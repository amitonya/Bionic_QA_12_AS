function Main()
{
  try
  {
    CreateFile()
    EditFile()
    DeleteFile()
     
  }
  catch(exception)
  {
    Log.Error("Exception", exception.description);
  }
}

function CreateFile()
{
  var  notepad;
  var  wndNotepad;
  //Open Notepad
  TestedApps.notepad.Run();
  notepad = Aliases.notepad;
  wndNotepad = notepad.wndNotepad;
  wndNotepad.Edit.Keys("TonyaTonyaTonyaTonyaTonya");
  //Create file
  wndNotepad.MainMenu.Click("File|Save");
  notepad.dlgSaveAs.SaveFile("C:\\Documents and Settings\\Tester\\Desktop\\Automation", "Text Documents (*.txt)");
  //Create checkpoint
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, cmpEqual, "TonyaTonyaTonyaTonyaTonya", false);
  wndNotepad.Close();
}



function EditFile()
{
  var  notepad;
  var  wndNotepad;
  var  edit;
  //Open Notepad
  TestedApps.notepad.Run();
  //Open file
  notepad = Aliases.notepad;
  wndNotepad = notepad.wndNotepad;
  wndNotepad.MainMenu.Click("File|Open...");
  notepad.dlgOpen.OpenFile("C:\\Documents and Settings\\Tester\\Desktop\\Automation.txt", "Text Documents (*.txt)");
  //Edit file
  edit = wndNotepad.Edit;
  edit.Drag(231, 11, -188, 19);
  edit.Keys("[BS]");
  //Save changes
  wndNotepad.MainMenu.Click("File|Save");
  //Close Notepad
  wndNotepad.Close();
  //Open Notepad
  TestedApps.notepad.Run();
  //Open file
  notepad = Aliases.notepad;
  wndNotepad = notepad.wndNotepad;
  wndNotepad.MainMenu.Click("File|Open...");
  notepad.dlgOpen.OpenFile("C:\\Documents and Settings\\Tester\\Desktop\\Automation.txt", "Text Documents (*.txt)");
  //Create checkpoint
  aqObject.CompareProperty(Aliases.notepad.wndNotepad.Edit.wText, cmpEqual, "Tonya", false);
  //Close Notepad
  wndNotepad.Close();
}

function DeleteFile()
{
  aqFileSystem.DeleteFile("C:\\Documents and Settings\\Tester\\Desktop\\Automation.txt");
}
