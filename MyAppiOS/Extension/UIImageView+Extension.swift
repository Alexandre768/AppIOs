import UIKit
//Tentei buscar o URL da imagem mas esse que esta é somente de um personagem.

extension UIImageView {
    func download(path: String) {
        var imageUrl = URL(string:path)!
        //imageUrl.append(path: path)

        let task = URLSession.shared.dataTask(with: .init(url: imageUrl)) { data, response, error in
            if error != nil { return }

            guard let data else { return }

            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }

        task.resume()
    }
}
