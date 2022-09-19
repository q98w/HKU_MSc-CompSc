import os
import sys


def read_graph_search_problem(file_path):
    file = open(file_path)
    context = file.read()
    rows = context.split('\n')
    file.close()

    problem = {'map': {}}

    for row in rows[:2]:
        record = row.split(': ')
        problem[record[0]] = record[1]

    for row in rows[2:]:
        record = row.split(' ')
        if len(record) == 2:
            problem['map'][record[0]] = []
        else:
            problem['map'][record[0]].append(record[1])

    return problem


def read_8queens_search_problem(file_path):
    # Your p6 code here
    problem = ''
    return problem


if __name__ == "__main__":
    if len(sys.argv) == 3:
        problem_id, test_case_id = sys.argv[1], sys.argv[2]
        if int(problem_id) <= 5:
            problem = read_graph_search_problem(os.path.join('test_cases', 'p' + problem_id, test_case_id + '.prob'))
        else:
            problem = read_8queens_search_problem(os.path.join('test_cases', 'p' + problem_id, test_case_id + '.prob'))
        print(problem)
    else:
        print('Error: I need exactly 2 arguments!')
