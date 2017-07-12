
gps_info = load('d:\Datasets\FAM-MAP\ImageCollectionCoordinates.mat')

% for i = 1:2474
%     for j = 1:2474
%         gt_dist_matrix(i,j) = norm(gps_info.GPS(i,:) - gps_info.GPS(j,:));
%     end
% end

bin_gt_dist_matrix = gt_dist_matrix > 10.0;
imshow(bin_gt_dist_matrix)