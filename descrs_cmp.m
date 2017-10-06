function descrs_cmp(method, dataset)

descrs = load('descrs.mat');

desc_info = size(descrs.descrs)

for i = 1:desc_info(2)
    vi = descrs.descrs(:,i);
    vi = vi/abs(sum(vi));
    
    for j = i:desc_info(2)
        vj = descrs.descrs(:,j);
        vj = vj/abs(sum(vj));
        
        score = 0;
        for k = 1:length(vi)
            if ((vi(k) ~= 0) && (vj(k) ~= 0))
                score = score + (abs(vi(k) - vj(k)) - abs(vi(k)) - abs(vj(k)));
            end
        end
        corr_matrix(i,j) = -score/2.0;        
    end
end

for i = 1:desc_info(2)
    corr_matrix(i,:) = corr_matrix(i,:)/corr_matrix(i,i);
end

% esti_corr_mat = dist_matrix< 1.0;
save(strcat(method,'_',dataset,'_corr_matrix.mat'), 'corr_matrix')
imshow(corr_matrix)