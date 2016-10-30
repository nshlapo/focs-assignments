"""
FOCS Graph library

This represents a graph

Author : Oliver Steele <oliver.steele@olin.edu>
Date   : 2016-10-27
License: MIT License
"""
from __future__ import print_function
from queue import Queue


class Graph(object):
    """A minimal graph using adjacency lists.

    This implementation includes a utility function to retrieve the node with a given label.
    This makes sense iff nodes are objects with a `label` attribute.
    """

    def __init__(self, nodes=[], edges=[]):
        self.nodes = nodes
        self.adjacency_list = {n: [tail for (head, tail) in edges if head == n] for n in nodes}

    def find_node(self, label):
        """Find a node by its label."""
        return next((node for node in self.nodes if node.label == label), None)

    def successors(self, node):
        """Return a list of successors."""
        return self.adjacency_list[node]

    def predecessor(self, node):
        """Return a list of predecessors."""
        # shown for completeness. If this function is called often, this is the wrong data structure.
        return [head for head in self.nodes if node in self.successors(head)]


class Node(object):
    """A node of a graph. Instances print as their labels. This class can be used to construct nodes
    that can accomodate additional attributes."""

    def __init__(self, label):
        self.label = label
        self.distance = 0

    def __repr__(self):
        return self.label


def bfs(graph, start, span_graph):
    remaining_nodes = Queue()
    visited = set()

    def visit(node):
        print(node)
        span_graph.adjacency_list[node] = []
        visited.add(node)
        for tail in graph.successors(node):
            if tail not in visited:
                tail.distance = node.distance + 1
                remaining_nodes.put(tail)
                span_graph.adjacency_list[node].append(tail)


    remaining_nodes.put(start)
    while not remaining_nodes.empty():
        n = remaining_nodes.get()
        visit(n)


def node_and_edge_labels_to_objects(node_labels, edge_labels):
    """Given a list of node labels, and a list of edges of the form (head_label, tail_label),
    create and return a list of Node instances with those labels, and a corresponding list of
    edges whose head and tail are those instances."""

    nodes = [Node(label) for label in node_labels]
    find_node = {node.label: node for node in nodes}.get
    edges = [(find_node(h), find_node(t)) for (h, t) in edge_labels]
    return nodes, edges

node_labels = ['a', 'b', 'c', 'd', 'e']
edge_labels = [('a', 'b'), ('a', 'c'), ('b', 'd'), ('b', 'e'), ('e', 'a')]

g = Graph(*node_and_edge_labels_to_objects(node_labels, edge_labels))
f = Graph()

bfs(g, g.find_node('a'), f)

# Code to show #1 works
print (f.adjacency_list)

# Code to show #2 works
for node in g.adjacency_list.keys():
    print (str(node) + ':' + str(node.distance))
