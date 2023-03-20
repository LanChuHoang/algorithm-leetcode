import Foundation

let numVertices = 9;
let graph = [
    [0, 4, 0, 0, 0, 0, 0, 8, 0],
    [4, 0, 8, 0, 0, 0, 0, 11, 0],
    [0, 8, 0, 7, 0, 4, 0, 0, 2],
    [0, 0, 7, 0, 9, 14, 0, 0, 0],
    [0, 0, 0, 9, 0, 10, 0, 0, 0],
    [0, 0, 4, 14, 10, 0, 2, 0, 0],
    [0, 0, 0, 0, 0, 2, 0, 1, 6],
    [8, 11, 0, 0, 0, 0, 1, 0, 7],
    [0, 0, 2, 0, 0, 0, 6, 7, 0]
];

func minDistanceVertex(dist: [Int], sptSet: [Bool]) -> Int {
    var min = Int.max
    var minIndex = 0
    for i in 0..<dist.count {
        if (sptSet[i] == false && dist[i] < min) {
            min = dist[i]
            minIndex = i
        }
    }
    return minIndex
}

func dijkstra(graph: [[Int]], startVertex: Int) -> [Int] {
    var dist = Array(repeating: Int.max, count: numVertices)
    var sptSet = Array(repeating: false, count: numVertices)
    dist[startVertex] = 0
    
    for _ in 0..<numVertices-1 {
        let currentVertex = minDistanceVertex(dist: dist, sptSet: sptSet)
        sptSet[currentVertex] = true
        for vertex in 0..<numVertices {
            if !sptSet[vertex] && graph[currentVertex][vertex] != 0 && dist[currentVertex] != Int.max && dist[currentVertex] + graph[currentVertex][vertex] < dist[vertex] {
                dist[vertex] = dist[currentVertex] + graph[currentVertex][vertex]
            }
        }
    }
    
    return dist
}

print(dijkstra(graph: graph, startVertex: 0))
