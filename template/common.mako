## -*- Python -*-

## -*- coding: utf-8 -*-

## #################################################################################################
##
## SimpleMorphoMath - A simple mathematical morphology library.
## Copyright (C) 2012 Salvaire Fabrice
##
## #################################################################################################

<%def name="doc()">
<%
if python_mode:
    text = capture(caller.body)
    output_text = '#  ' + '\n#  '.join(text.splitlines())
    context.write(output_text)
if rest_mode:
    caller.body()
%>
</%def>

<%def name="code()">
<%
result_pattern = '@result@ '
print_pattern = 'print '
text = capture(caller.body)
python_code = text.replace(result_pattern, print_pattern)
if python_mode:
    context.write(python_code)
if rest_mode:
    python_code_lines = python_code.splitlines()
    # remove first empty line
    if not python_code_lines[0]:
        del python_code_lines[0]
    context.write('  ' + '\n  '.join(python_code_lines))
    location = text.find(result_pattern)
    if location != -1:
        exec(python_code[:location]) in exec_dict
        code = python_code_lines[-1][len(print_pattern):].strip()
        exec('output = ' + code) in exec_dict
        output_text = unicode(exec_dict['output'])
        context.write('\n\nResult::\n\n')
        output_rest = '  ' + '\n  '.join(output_text.splitlines())
        context.write(output_rest)
%>
</%def>

## #################################################################################################
##
## End
##
## #################################################################################################
