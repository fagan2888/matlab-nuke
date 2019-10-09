function closeEdit()
%CLOSEDIT closes the file editor windows
% https://stackoverflow.com/questions/28119360/how-to-close-one-or-all-currently-open-matlab-m-files-from-matlab-command-pr

edtSvc  = com.mathworks.mlservices.MLEditorServices;
edtSvc.getEditorApplication.closeNoPrompt;

end % function