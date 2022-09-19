import collections
import copy
import grader
import parse
import sys


def dfs_search(problem):
    start = problem.get('start_state')
    target = problem.get('goal_states')
    whole_map = problem.get('map')

    edge = collections.deque([[start]])

    visited = []

    while edge:
        path = edge.pop()
        if path[-1] == target:
            return generate_solution(visited, path)
        if path[-1] not in visited:
            visited.append(path[-1])
            for node in whole_map.get(path[-1]):
                new_path = copy.deepcopy(path)
                new_path.append(node)
                edge.append(new_path)


def generate_solution(visited, path):
    solution = ''
    for i in visited:
        solution += i + ' '
    solution = solution.strip()
    solution += '\n'
    for i in path:
        solution += i + ' '
    solution = solution.strip()
    return solution


if __name__ == "__main__":
    test_case_id = int(sys.argv[1])
    problem_id = 1
    grader.grade(problem_id, test_case_id, dfs_search, parse.read_graph_search_problem)
