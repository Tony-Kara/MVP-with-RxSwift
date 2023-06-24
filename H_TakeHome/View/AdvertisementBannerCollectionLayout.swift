import UIKit

final class AdvertisementBannerCollectionLayout: UICollectionViewFlowLayout {

  // MARK: - Private properties

  private var previousOffset: CGFloat = 0
  private var currentPage: Int = 0

  // MARK: - Public functions

  override func prepare() {
    guard let collection = collectionView else {
      return
    }

    scrollDirection = .horizontal

    sectionInset = .init(
      top: 8,
      left: 12,
      bottom: 8,
      right: 12
    )

    let width = collection.frame.width - 32
    let itemHeight = collection.frame.height
    itemSize = .init(width: width, height: itemHeight)

    minimumLineSpacing = 8
    minimumInteritemSpacing = 8
  }

  override func targetContentOffset(
    forProposedContentOffset proposedContentOffset: CGPoint,
    withScrollingVelocity velocity: CGPoint
  ) -> CGPoint {
    guard let collectionView = collectionView else {
      return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
    }

    let itemsCount = collectionView.numberOfItems(inSection: 0)

    if previousOffset > collectionView.contentOffset.x && velocity.x < 0 {
      currentPage = max(currentPage - 1, 0)
    } else if previousOffset < collectionView.contentOffset.x && velocity.x > 0 {
      currentPage = min(currentPage + 1, itemsCount - 1)
    }

    let updatedOffset = (itemSize.width + minimumInteritemSpacing) * CGFloat(currentPage)
    previousOffset = updatedOffset

    return CGPoint(x: updatedOffset, y: proposedContentOffset.y)
  }
}
