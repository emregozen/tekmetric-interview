import { useEffect, useMemo, useState } from 'react';
import {
  createColumnHelper,
  flexRender,
  getCoreRowModel,
  useReactTable,
  getSortedRowModel,
  SortingState,
  PaginationState,
} from '@tanstack/react-table';
import { RepairService } from '../types/api';
import { StatusBadge } from './StatusBadge';
import { ErrorIcon, EditIcon, DeleteIcon } from './svg';
import { PaginationButton } from './PaginationButton';
import { Modal } from './Modal';
import { NewServiceRequestForm } from './NewServiceRequestForm';
import { ConfirmationModal } from './ConfirmationModal';
import { useUpdateRepairService } from '../hooks/useUpdateRepairService';
import { useDeleteRepairService } from '../hooks/useDeleteRepairService';
import { ExpandableText } from './ui';
import { usePermissions } from '../hooks/usePermissions';

const columnHelper = createColumnHelper<RepairService>();

type RepairServicesTableProps = {
  data: RepairService[];
  pageInfo: {
    currentPage: number;
    totalPages: number;
    totalItems: number;
    pageSize: number;
  } | null;
  isLoading: boolean;
  error: Error | null;
  onPageChange: (pageIndex: number, pageSize: number) => void;
  sorting: SortingState;
  onSortingChange: (sorting: SortingState) => void;
  onServiceUpdated: () => void;
};

export const RepairServicesTable = ({
  data,
  pageInfo,
  isLoading,
  error,
  onPageChange,
  sorting,
  onSortingChange,
  onServiceUpdated,
}: RepairServicesTableProps) => {
  const [isEditModalOpen, setIsEditModalOpen] = useState(false);
  const [serviceToEdit, setServiceToEdit] = useState<RepairService | null>(null);

  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);
  const [serviceToDelete, setServiceToDelete] = useState<RepairService | null>(null);

  const { updateService, error: updateError } = useUpdateRepairService();
  const { deleteService, error: deleteError, isLoading: isDeleting } = useDeleteRepairService();

  const { hasWritePermission } = usePermissions();
  const [canWrite, setCanWrite] = useState(false);

  useEffect(() => {
    const checkPermissions = async () => {
      const hasPermission = await hasWritePermission();
      setCanWrite(hasPermission);
    };

    checkPermissions();
  }, [hasWritePermission]);

  const handleEditClick = (service: RepairService) => {
    setServiceToEdit(service);
    setIsEditModalOpen(true);
  };

  const handleDeleteClick = (service: RepairService) => {
    setServiceToDelete(service);
    setIsDeleteModalOpen(true);
  };

  const handleCloseEditModal = () => {
    setIsEditModalOpen(false);
    setServiceToEdit(null);
  };

  const handleCloseDeleteModal = () => {
    setIsDeleteModalOpen(false);
    setServiceToDelete(null);
  };

  const handleUpdateService = async (formData: any) => {
    if (!serviceToEdit) return;

    const serviceData = {
      customerName: formData.customerName,
      customerPhone: formData.customerPhone,
      vehicleMake: formData.vehicleMake,
      vehicleModel: formData.vehicleModel,
      vehicleYear: Number(formData.vehicleYear),
      licensePlate: formData.licensePlate,
      serviceDescription: formData.serviceDescription || '',
      odometerReading: Number(formData.odometerReading),
      status: formData.status,
    };

    await updateService(serviceToEdit.id, serviceData);
    setIsEditModalOpen(false);
    onServiceUpdated();
  };

  const handleDeleteService = async () => {
    if (!serviceToDelete) return;

    await deleteService(serviceToDelete.id);
    setIsDeleteModalOpen(false);
    onServiceUpdated();
  };
  const columns = useMemo(
    () => [
      columnHelper.accessor('id', {
        header: 'ID',
        cell: info => info.getValue(),
      }),
      columnHelper.accessor('customerName', {
        header: 'Customer Name',
        cell: info => info.getValue(),
      }),
      columnHelper.accessor('customerPhone', {
        header: 'Phone',
        cell: info => info.getValue(),
      }),
      columnHelper.accessor('vehicleMake', {
        header: 'Make',
        cell: info => info.getValue(),
      }),
      columnHelper.accessor('vehicleModel', {
        header: 'Model',
        cell: info => info.getValue(),
      }),
      columnHelper.accessor('vehicleYear', {
        header: 'Year',
        cell: info => info.getValue(),
      }),
      columnHelper.accessor('licensePlate', {
        header: 'License Plate',
        cell: info => info.getValue(),
      }),
      columnHelper.accessor('serviceDescription', {
        header: 'Service Description',
        cell: info => <ExpandableText text={info.getValue() || ''} maxLength={40} />,
      }),
      columnHelper.accessor('odometerReading', {
        header: 'Odometer',
        cell: info => info.getValue().toLocaleString(),
      }),
      columnHelper.accessor('status', {
        header: 'Status',
        cell: info => <StatusBadge status={info.getValue()} />,
      }),
      columnHelper.display({
        id: 'actions',
        header: 'Actions',
        cell: props => {
          const service = props.row.original;
          return (
            <div className="flex space-x-4">
              <button
                onClick={() => handleEditClick(service)}
                className={`text-blue-600 p-1 rounded transition-colors ${
                  canWrite
                    ? 'hover:text-blue-800 hover:bg-blue-50'
                    : 'opacity-50 cursor-not-allowed'
                }`}
                title={canWrite ? 'Edit service' : "You don't have permission to edit"}
                aria-label="Edit service"
                disabled={!canWrite}
              >
                <EditIcon />
              </button>
              <button
                onClick={() => handleDeleteClick(service)}
                className={`text-red-600 p-1 rounded transition-colors ${
                  canWrite ? 'hover:text-red-800 hover:bg-red-50' : 'opacity-50 cursor-not-allowed'
                }`}
                title={canWrite ? 'Delete service' : "You don't have permission to delete"}
                aria-label="Delete service"
                disabled={!canWrite}
              >
                <DeleteIcon />
              </button>
            </div>
          );
        },
      }),
    ],
    [canWrite]
  );

  const pagination: PaginationState = {
    pageIndex: pageInfo?.currentPage || 0,
    pageSize: pageInfo?.pageSize || 10,
  };

  const table = useReactTable({
    data: data || [],
    columns,
    pageCount: pageInfo?.totalPages || 1,
    state: {
      sorting,
      pagination,
    },
    onSortingChange: updater => {
      const newSorting = typeof updater === 'function' ? updater(sorting) : updater;
      onSortingChange(newSorting);
    },
    onPaginationChange: newPagination => {
      const updatedPagination =
        typeof newPagination === 'function' ? newPagination(pagination) : newPagination;
      onPageChange(updatedPagination.pageIndex, updatedPagination.pageSize);
    },
    getCoreRowModel: getCoreRowModel(),
    getSortedRowModel: getSortedRowModel(),
    manualPagination: true,
    autoResetPageIndex: false,
  });

  if (error) {
    return (
      <div className="bg-red-50 border-l-4 border-red-500 p-4 mb-4">
        <div className="flex">
          <div className="flex-shrink-0">
            <ErrorIcon />
          </div>
          <div className="ml-3">
            <p className="text-sm text-red-700">
              Error loading repair services: {error?.message || 'Unknown error'}
            </p>
          </div>
        </div>
      </div>
    );
  }

  if (isLoading) {
    return (
      <div className="w-full h-64 flex items-center justify-center">
        <div className="flex flex-col items-center">
          <div className="animate-spin rounded-full h-12 w-12 border-t-2 border-b-2 border-blue-500 mb-4"></div>
          <p className="text-gray-500">Loading repair services...</p>
        </div>
      </div>
    );
  }

  return (
    <div className="flex flex-col h-[calc(100vh-220px)]">
      <div className="overflow-x-auto flex-grow">
        <div className="inline-block min-w-full align-middle h-full">
          <div className="overflow-hidden shadow-sm ring-1 ring-black ring-opacity-5 h-full flex flex-col">
            <div className="overflow-y-auto flex-grow">
              <table className="min-w-full divide-y divide-gray-200 table-fixed">
                <colgroup>
                  <col className="w-[3%]" /> {/* ID */}
                  <col className="w-[10%]" /> {/* Customer Name */}
                  <col className="w-[10%]" /> {/* Phone */}
                  <col className="w-[8%]" /> {/* Make */}
                  <col className="w-[8%]" /> {/* Model */}
                  <col className="w-[6%]" /> {/* Year */}
                  <col className="w-[8%]" /> {/* License Plate */}
                  <col className="w-[24%]" /> {/* Service Description */}
                  <col className="w-[8%]" /> {/* Odometer */}
                  <col className="w-[8%]" /> {/* Status */}
                  <col className="w-[7%]" /> {/* Actions */}
                </colgroup>
                <thead className="bg-gray-50 sticky top-0 z-10">
                  {table.getHeaderGroups().map(headerGroup => (
                    <tr key={headerGroup.id}>
                      {headerGroup.headers.map(header => (
                        <th
                          key={header.id}
                          className="px-4 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider cursor-pointer"
                          onClick={header.column.getToggleSortingHandler()}
                        >
                          <div className="flex items-center">
                            {flexRender(header.column.columnDef.header, header.getContext())}
                            <span>
                              {{
                                asc: ' 🔼',
                                desc: ' 🔽',
                              }[header.column.getIsSorted() as string] ?? null}
                            </span>
                          </div>
                        </th>
                      ))}
                    </tr>
                  ))}
                </thead>
                <tbody className="bg-white divide-y divide-gray-200">
                  {table.getRowModel().rows.length > 0 ? (
                    table.getRowModel().rows.map(row => (
                      <tr key={row.id} className="hover:bg-gray-50">
                        {row.getVisibleCells().map(cell => (
                          <td
                            key={cell.id}
                            className={`px-4 py-4 text-sm text-gray-500 ${
                              cell.column.id === 'serviceDescription' ? '' : 'whitespace-nowrap'
                            }`}
                          >
                            {flexRender(cell.column.columnDef.cell, cell.getContext())}
                          </td>
                        ))}
                      </tr>
                    ))
                  ) : (
                    <tr>
                      <td
                        colSpan={columns.length}
                        className="px-6 py-4 text-center text-sm text-gray-500"
                      >
                        No repair services found
                      </td>
                    </tr>
                  )}
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>

      <div className="flex items-center justify-between px-4 py-3 bg-white border border-gray-200 rounded-b-md h-16 mt-auto sticky bottom-0">
        <div className="flex items-center">
          <span className="text-sm text-gray-700">
            Page <span className="font-medium">{table.getState().pagination.pageIndex + 1}</span> of{' '}
            <span className="font-medium">{pageInfo?.totalPages || 1}</span>
            {pageInfo && ` (${pageInfo.totalItems} total items)`}
          </span>
        </div>
        <div className="flex space-x-2">
          <PaginationButton
            onClick={() => {
              const newPage = Math.max(0, pagination.pageIndex - 1);
              onPageChange(newPage, pagination.pageSize);
            }}
            disabled={pagination.pageIndex <= 0}
          >
            Previous
          </PaginationButton>
          <PaginationButton
            onClick={() => {
              const newPage = pagination.pageIndex + 1;
              onPageChange(newPage, pagination.pageSize);
            }}
            disabled={pageInfo ? pagination.pageIndex >= pageInfo.totalPages - 1 : true}
          >
            Next
          </PaginationButton>
        </div>
      </div>

      <Modal
        isOpen={isEditModalOpen}
        onClose={handleCloseEditModal}
        title="Edit Service Request"
        footer={
          updateError ? (
            <div className="w-full p-2 bg-red-100 border border-red-400 text-red-700 rounded">
              {updateError.message}
            </div>
          ) : null
        }
      >
        {serviceToEdit && (
          <NewServiceRequestForm
            onSave={handleUpdateService}
            onCancel={handleCloseEditModal}
            initialValues={{
              customerName: serviceToEdit.customerName,
              customerPhone: serviceToEdit.customerPhone,
              vehicleMake: serviceToEdit.vehicleMake,
              vehicleModel: serviceToEdit.vehicleModel,
              vehicleYear: serviceToEdit.vehicleYear,
              licensePlate: serviceToEdit.licensePlate,
              serviceDescription: serviceToEdit.serviceDescription,
              odometerReading: serviceToEdit.odometerReading,
              status: serviceToEdit.status,
            }}
          />
        )}
      </Modal>

      <ConfirmationModal
        isOpen={isDeleteModalOpen}
        onClose={handleCloseDeleteModal}
        onConfirm={handleDeleteService}
        title="Delete Service Request"
        message={
          deleteError ? (
            <div className="p-2 mb-3 bg-red-100 border border-red-400 text-red-700 rounded">
              {deleteError.message}
              <hr className="my-2" />
              Are you sure you want to delete this service request? This action cannot be undone.
            </div>
          ) : (
            'Are you sure you want to delete this service request? This action cannot be undone.'
          )
        }
        confirmButtonText="Delete"
        isLoading={isDeleting}
      />
    </div>
  );
};
