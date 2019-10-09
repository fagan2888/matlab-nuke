function closeFigs()
%CLOSEFIGS closes all the figures in the figure window
% Originally in nuke()

% Grab the root window object
root = handle(0);

% Use FINDALL to grab figures with hidden handles (such as GUIDE GUIs)
try
    figs = findall(root, 'type', 'figure');
catch
    return
end

figs = handle(figs);
figs = figs(figs ~= root);

% We want to use delete NOT close because we don't want CloseRequestFcn to
% be evaluated. Also, by deleting the HANDLE(fig) and not the numeric
% handle, we won't trigger the ObjectBeingDestroyed event which may or may
% not have listeners
delete(figs);

end % function